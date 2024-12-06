import dvv_module
import numpy as np
import os
import matplotlib.pyplot as plt
from obspy import UTCDateTime
import datetime

output_dir = "./stretching/"
input_file = "../../data/msnoise_v9/stack2npy/CH_BOURR_CH_MTI02_comp_ZZ_filt0.1_0.35_stack007.npy"

tref_start_str = "2019-12-21"
tref_end_str = "2020-03-19"
tref_start = np.datetime64(tref_start_str)
tref_end = np.datetime64(tref_end_str)

dvv_max = 4/100  
nbtrial = 50       
cc_thresh = 0.1
vmin = 1.8 # minimum group velocity km/s
dist = 40.29792484214646 # inter-station distance in km
lwin = 30   # length of window in s
twin = [int(dist/vmin), int(dist/vmin)+lwin] 
dpi=300

# Get station names from file name
dum = os.path.split(input_file)[1].split("_stacks")[0].split("_")
sta1 = f"{dum[0]}.{dum[1]}"
sta2 = f"{dum[2]}.{dum[3]}"
print(f"Station pair: {sta1} - {sta2}")

# Read file
data = np.load(input_file, allow_pickle=True)
ndata = data["CCdata"].T
tlag_all = data["tlag"]
timestamp = data["times"].astype(np.datetime64)
sampling_rate = data["sampling_rate"]
fmin   = data["fmin"]
fmax   = data["fmax"]
comp   = data["comp"]
maxlag = data["maxlag"]
stack  = data["stack"]

# Define new substack length and step
stacklen_new = np.timedelta64(int(stack), "D") #5
step = np.timedelta64(1, "D")


#dist = data["dist"]
npts_all = ndata.shape[1]
npts = npts_all//2
tlag = tlag_all[npts:]
ndata_pos = ndata[:, npts:]  # positive lag
ndata_neg = np.fliplr(ndata[:, :npts + 1])  # negative lag
ndata_sym = np.mean(np.vstack((ndata_pos[np.newaxis], ndata_neg[np.newaxis])), axis=0)
twin_indx = np.where((tlag >= np.min(twin)) & (tlag < np.max(twin)))[0]
npts_win = len(twin_indx)

# Get reference stack
iref = np.where((timestamp > tref_start) & (timestamp < tref_end))[0]
refstack = np.mean(ndata[iref, :], axis=0)
refstack_pos = np.mean(ndata_pos[iref, :], axis=0)
refstack_neg = np.mean(ndata_neg[iref, :], axis=0)
refstack_sym = np.mean(ndata_sym[iref, :], axis=0)

# Change substack length
_, ndata = dvv_module.change_substack_length(timestamp, ndata, stacklen_new, step, dt=1/sampling_rate)
_, ndata_sym = dvv_module.change_substack_length(timestamp, ndata_sym, stacklen_new, step, dt=1/sampling_rate)
_, ndata_pos = dvv_module.change_substack_length(timestamp, ndata_pos, stacklen_new, step, dt=1/sampling_rate)
timestamp, ndata_neg = dvv_module.change_substack_length(timestamp, ndata_neg, stacklen_new, step, dt=1/sampling_rate)

# Get correlation coefficient between substack and reference (before stretching)
nwin = ndata_sym.shape[0]
cc_pos = np.zeros(shape=(nwin,), dtype=np.float32)
cc_neg = np.zeros(shape=(nwin,), dtype=np.float32)
cc_sym = np.zeros(shape=(nwin,), dtype=np.float32)
for iwin in range(nwin):
    cc_pos[iwin] = np.corrcoef(refstack_pos[twin_indx], ndata_pos[iwin, twin_indx])[0, 1]
    cc_neg[iwin] = np.corrcoef(refstack_neg[twin_indx], ndata_neg[iwin, twin_indx])[0, 1]
    cc_sym[iwin] = np.corrcoef(refstack_sym[twin_indx], ndata_sym[iwin, twin_indx])[0, 1]

param  = {
    'freq':[fmin,fmax], # frequency of bandpass filter applied to stacks
    'twin': twin,  # start-end of time window in s
    'dt': 1/sampling_rate,  # sampling interval in s
    't': tlag  # vector of lag time
}

# allocate matrix for dvv and its uncertainty
dvv_stretch = np.empty(shape=(nwin,6),dtype=np.float32)
ccafter_stretch = np.empty(shape=(nwin,3),dtype=np.float32)

dvv_stretch[:] = np.nan
ccafter_stretch[:] = np.nan

# loop through each substack window
for iwin in range(nwin):
    
    # symmetric, casual and acausal lags for both ref and current waveform
    pcur = ndata_pos[iwin,twin_indx]   # substack, positive lag
    ncur = ndata_neg[iwin,twin_indx]   # substack, negative lag
    scur = ndata_sym[iwin,twin_indx]   # substack, symmetric lag
    pref = refstack_pos[twin_indx]  # reference, positive lag
    nref = refstack_neg[twin_indx]  # reference, negative lag
    sref = refstack_sym[twin_indx]  # reference, symmetric lag
    
    if cc_pos[iwin] >= cc_thresh: # Only keep substack if correlation coefficient before stretching above threshold
        dvv, error,ccafter_pos,cdp_pos = dvv_module.stretching_vect(pref,pcur,dvv_max,nbtrial,param)        
        #print(f"window {timestamp[iwin]} sym lag: dv/v = {dvv:.2f}, error = {error:.2f}")
        # print(f"window {timestamp[iwin]} positive lag: dv/v = {dvv:.2f}, error = {error:.2f}")
        dvv_stretch[iwin,0],dvv_stretch[iwin,1] = dvv, error
        ccafter_stretch[iwin,0] = ccafter_pos
    if cc_neg[iwin] >= cc_thresh:
        dvv, error,ccafter_neg,cdp_neg = dvv_module.stretching_vect(nref,ncur,dvv_max,nbtrial,param)        
        #print(f"window {timestamp[iwin]} pos lag: dv/v = {dvv:.2f}, error = {error:.2f}")
        # print(f"window {timestamp[iwin]} negative lag: dv/v = {dvv:.2f}, error = {error:.2f}")
        dvv_stretch[iwin,2],dvv_stretch[iwin,3] = dvv, error        
        #ccafter_stretch[iwin,1] = ccafter_pos
        ccafter_stretch[iwin,1] = ccafter_neg
    if cc_sym[iwin] >= cc_thresh:
        dvv, error,ccafter_sym,cdp_sym = dvv_module.stretching_vect(sref,scur,dvv_max,nbtrial,param)        
        #print(f"window {timestamp[iwin]} neg lag: dv/v = {dvv:.2f}, error = {error:.2f}")
        # print(f"window {timestamp[iwin]} sym lag: dv/v = {dvv:.2f}, error = {error:.2f}")
        dvv_stretch[iwin,4],dvv_stretch[iwin,5] = dvv, error        
        ccafter_stretch[iwin,2] = ccafter_pos
        #ccafter_stretch[iwin,2] = ccafter_sym
    #print(dvv_stretch[iwin,:])

plt.figure(figsize=(15,25))
ax0= plt.subplot(612)

# 2D waveform matrix
ax0.matshow(ndata_sym,cmap='seismic',extent=[tlag[0],tlag[-1],nwin,0],aspect='auto')
#ax0.set(xlabel="Lag time [s]", ylabel=f"Substack {str(stacklen_new)}") #, title=f"{sta1}-{sta2} {str(stacklen_new)} substacks")
ax0.set_xlabel("Lag time [s]", size=22)
ax0.set_ylabel(f"Substack days", size=22) #"{str(stacklen_new)}", size=22)
ax0.set_title(f"{sta1}-{sta2} {str(comp)} Components. {str(stacklen_new)} substacks. Filter {str(fmin)} - {str(fmax)} Hz", size=22)
ax0.tick_params(axis='y', labelcolor='black', labelsize='20')
ax0.tick_params(axis='x', labelcolor='black', labelsize='20')
ax0.plot([0,0],[0,nwin],'k--',linewidth=2)
# shade the coda part
pwin_indx = np.where((tlag >= np.min(twin)) & (tlag < np.max(twin)))[0] # positive lag time indices for dvv window
ax0.fill(np.concatenate((tlag[pwin_indx],np.flip(tlag[pwin_indx],axis=0)),axis=0), \
    np.concatenate((np.ones(len(nwin_indx))*0,np.ones(len(nwin_indx))*nwin),axis=0),'y', alpha=0.3)
ax0.xaxis.set_ticks_position('bottom')
ax0.axvline(dist/vmin, c="k", ls=":", lw="3")
#ax0.legend([f"Reference stack: {tref_start_str} to {tref_end_str}", f"Direct arrival v={vmin:.1f} km/s", "analysis window"],loc='upper right')

# reference waveform
ax1 = plt.subplot(613)
ax1.plot(tlag,refstack_sym,'k-',linewidth=1)
#ax1.set_title(f"Reference stack", size=22)
ax1.autoscale(enable=True, axis='x', tight=True)
ax1.grid(True)
ax1.tick_params(axis='y', labelcolor='black', labelsize='20')
ax1.tick_params(axis='x', labelcolor='black', labelsize='20')
ax1.axvline(dist/vmin, c="r", ls=":")
ylims = ax1.get_ylim()
ax1.fill(np.concatenate((tlag[pwin_indx],np.flip(tlag[pwin_indx],axis=0)),axis=0), \
    np.concatenate((np.ones(len(nwin_indx))*ylims[0],np.ones(len(nwin_indx))*ylims[1]),axis=0),'y', alpha=0.3)
ax1.legend([f"Reference stack: {tref_start_str} to {tref_end_str}", f"Direct arrival v={vmin:.1f} km/s", "analysis window"],loc='upper right', fontsize="14")

#ax1.axvline(tlag[pwin_indx[0]], c="y")
#ax1.axvline(tlag[pwin_indx[-1]], c="y")


# Plot dv/v
ax2 = plt.subplot(614) #614
ax2.errorbar(t, dvv_stretch[:,4], yerr=dvv_stretch[:,5], c="b", capsize=2)
ax2.set_title(f"dv/v for symmetric window", size=22)
ax2.set_ylabel("dv/v [%]", size=22)     
ax2.xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d'))
ax2.tick_params(which='major', labelsize='20')
fmt_month = mdates.MonthLocator()
ax2.xaxis.set_minor_locator(fmt_month)
ax2.xaxis.grid(True, which='minor')
ax2.axhline(0, c="k", ls="-")
plt.setp(ax2.get_xticklabels(), rotation=30, ha='right')

# CC after stretching
ax3 = plt.subplot(615) # (615)
ax3.plot(t, ccafter_stretch[:,2], marker="o")
ax3.set_title(f"CC after stretching", size=22)
ax3.tick_params(axis='y', labelcolor='black', labelsize='20')
ax3.tick_params(axis='x', labelcolor='black', labelsize='20')
ax3.set_xlabel('Date', size='22', color='black')
ax3.set_ylabel("CC coeff", size=18)
fmt_month = mdates.MonthLocator()
ax3.xaxis.set_minor_locator(fmt_month)
ax3.xaxis.grid(True, which='minor')
plt.setp(ax3.get_xticklabels(), rotation=30, ha='right')

output_file = os.path.join(output_dir, f"{sta1}_{sta2}_stretching_{str(comp)}_{str(stacklen_new).replace(' ','')}\
_symlag_Filt{str(fmin)}_{str(fmax)}.pdf")
print(output_file)
plt.tight_layout(pad=0.5)
plt.savefig(output_file, format="PDF", dpi=dpi, bbox_inches='tight')
plt.show()
plt.close()

plt.figure(figsize=(15,25))
ax0= plt.subplot(612) #311
# 2D waveform matrix
ax0.matshow(ndata_pos,cmap='seismic',extent=[tlag[0],tlag[-1],nwin,0],aspect='auto')
#ax0.set(xlabel="Lag time [s]", ylabel=f"Substack {str(stacklen_new)}", title=f"{sta1} - {sta2} {str(stacklen_new)} substacks") #": {stacklen_new} substacks")
ax0.set_xlabel("Lag time [s]", size=22)
ax0.set_ylabel(f"Substack days", size=22) #"{str(stacklen_new)}", size=22)
ax0.set_title(f"{sta1}-{sta2} {str(comp)} Components. {str(stacklen_new)} substacks. Filter {str(fmin)} - {str(fmax)} Hz", size=22)
ax0.tick_params(axis='y', labelcolor='black', labelsize='20')
ax0.tick_params(axis='x', labelcolor='black', labelsize='20')
ax0.plot([0,0],[0,nwin],'k--',linewidth=2)
# shade the coda part
pwin_indx = np.where((tlag >= np.min(twin)) & (tlag < np.max(twin)))[0] # positive lag time indices for dvv window
ax0.fill(np.concatenate((tlag[pwin_indx],np.flip(tlag[pwin_indx],axis=0)),axis=0), \
    np.concatenate((np.ones(len(nwin_indx))*0,np.ones(len(nwin_indx))*nwin),axis=0),'y', alpha=0.3)
ax0.xaxis.set_ticks_position('bottom')
ax0.axvline(dist/vmin, c="k", ls=":", lw="3")

# reference waveform
ax1 = plt.subplot(613)
ax1.plot(tlag,refstack_pos,'k-',linewidth=1)
ax1.autoscale(enable=True, axis='x', tight=True)
ax1.grid(True)
ax1.tick_params(axis='y', labelcolor='black', labelsize='20')
ax1.tick_params(axis='x', labelcolor='black', labelsize='20')
ax1.axvline(dist/vmin, c="r", ls=":")
ylims = ax1.get_ylim()
ax1.fill(np.concatenate((tlag[pwin_indx],np.flip(tlag[pwin_indx],axis=0)),axis=0), \
    np.concatenate((np.ones(len(nwin_indx))*ylims[0],np.ones(len(nwin_indx))*ylims[1]),axis=0),'y', alpha=0.3)
ax1.legend([f"Reference stack: {tref_start_str} to {tref_end_str}", f"Direct arrival v={vmin:.1f} km/s", "analysis window"],loc='upper right', fontsize="14")

# Plot dv/v
ax2 = plt.subplot(614)
ax2.errorbar(t, dvv_stretch[:,0], yerr=dvv_stretch[:,1], c="b", capsize=2)
ax2.set_title(f"dv/v for positive lag", size=22)
ax2.set_ylabel("dv/v [%]", size=22)     
ax2.xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d'))
ax2.tick_params(which='major', labelsize='18')
fmt_month = mdates.MonthLocator()
ax2.xaxis.set_minor_locator(fmt_month)
ax2.xaxis.grid(True, which='minor')
ax2.axhline(0, c="k", ls="-")
plt.setp(ax2.get_xticklabels(), rotation=10, ha='right')

# CC after stretching
ax3 = plt.subplot(615)
ax3.plot(t, ccafter_stretch[:,0], marker="o")
ax3.set_title(f"CC after stretching", size=22)
ax3.tick_params(axis='y', labelcolor='black', labelsize='20')
ax3.tick_params(axis='x', labelcolor='black', labelsize='20')
ax3.set_xlabel('Date', size='22', color='black')
ax3.tick_params(which='major', labelsize='18')
ax3.set_ylabel("CC coeff", size=22)
fmt_month = mdates.MonthLocator()
ax3.xaxis.set_minor_locator(fmt_month)
ax3.xaxis.grid(True, which='minor')
plt.setp(ax3.get_xticklabels(), rotation=10, ha='right')    
    
output_file = os.path.join(output_dir, f"{sta1}_{sta2}_stretching_{str(comp)}_{str(stacklen_new).replace(' ','')}\
_poslag_Filt{str(fmin)}_{str(fmax)}.pdf")
print(output_file)
plt.tight_layout(pad=0.5)
plt.savefig(output_file, format="PDF", dpi=dpi, bbox_inches='tight')
plt.show()
plt.close()


plt.figure(figsize=(15,25))
ax0= plt.subplot(612) #311
# 2D waveform matrix
ax0.matshow(ndata_neg,cmap='seismic',extent=[tlag[0],tlag[-1],nwin,0],aspect='auto')
#ax0.set(xlabel="Lag time [s]", ylabel=f"Substack {str(stacklen_new)}", title=f"{sta1} - {sta2} {str(stacklen_new)} substacks") #": {stacklen_new} substacks")
ax0.set_xlabel("Lag time [s]", size=22)
ax0.set_ylabel(f"Substack days", size=22) #"{str(stacklen_new)}", size=22)
ax0.set_title(f"{sta1}-{sta2} {str(comp)} Components. {str(stacklen_new)} substacks. Filter {str(fmin)} - {str(fmax)} Hz", size=22)
ax0.tick_params(axis='y', labelcolor='black', labelsize='20')
ax0.tick_params(axis='x', labelcolor='black', labelsize='20')
ax0.plot([0,0],[0,nwin],'k--',linewidth=2)
# shade the coda part
pwin_indx = np.where((tlag >= np.min(twin)) & (tlag < np.max(twin)))[0] # positive lag time indices for dvv window
ax0.fill(np.concatenate((tlag[pwin_indx],np.flip(tlag[pwin_indx],axis=0)),axis=0), \
    np.concatenate((np.ones(len(nwin_indx))*0,np.ones(len(nwin_indx))*nwin),axis=0),'y', alpha=0.3)
ax0.xaxis.set_ticks_position('bottom')
ax0.axvline(dist/vmin, c="k", ls=":", lw="3")

# reference waveform
ax1 = plt.subplot(613)
ax1.plot(tlag,refstack_neg,'k-',linewidth=1)
ax1.autoscale(enable=True, axis='x', tight=True)
ax1.grid(True)
ax1.tick_params(axis='y', labelcolor='black', labelsize='20')
ax1.tick_params(axis='x', labelcolor='black', labelsize='20')
ax1.axvline(dist/vmin, c="r", ls=":")
ylims = ax1.get_ylim()
ax1.fill(np.concatenate((tlag[pwin_indx],np.flip(tlag[pwin_indx],axis=0)),axis=0), \
    np.concatenate((np.ones(len(nwin_indx))*ylims[0],np.ones(len(nwin_indx))*ylims[1]),axis=0),'y', alpha=0.3)
ax1.legend([f"Reference stack: {tref_start_str} to {tref_end_str}", f"Direct arrival v={vmin:.1f} km/s", "analysis window"],loc='upper right', fontsize="14")

# Plot dv/v
ax2 = plt.subplot(614)
ax2.errorbar(t, dvv_stretch[:,2], yerr=dvv_stretch[:,3], c="r", capsize=2)
ax2.set_title(f"dv/v for negative lag", size=22)
ax2.set_ylabel("dv/v [%]", size=22)     
ax2.xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d'))
ax2.tick_params(which='major', labelsize='18')
fmt_month = mdates.MonthLocator()
ax2.xaxis.set_minor_locator(fmt_month)
ax2.xaxis.grid(True, which='minor')
ax2.axhline(0, c="k", ls="-")
plt.setp(ax2.get_xticklabels(), rotation=10, ha='right')

# CC after stretching
ax3 = plt.subplot(615)
ax3.plot(t, ccafter_stretch[:,1], marker="o")
ax3.set_title(f"CC after stretching", size=22)
ax3.tick_params(axis='y', labelcolor='black', labelsize='20')
ax3.tick_params(axis='x', labelcolor='black', labelsize='20')
ax3.set_xlabel('Date', size='22', color='black')
ax3.tick_params(which='major', labelsize='18')
ax3.set_ylabel("CC coeff", size=22)
fmt_month = mdates.MonthLocator()
ax3.xaxis.set_minor_locator(fmt_month)
ax3.xaxis.grid(True, which='minor')
plt.setp(ax3.get_xticklabels(), rotation=10, ha='right')     
    
output_file = os.path.join(output_dir, f"{sta1}_{sta2}_stretching_{str(comp)}_{str(stacklen_new).replace(' ','')}\
_neglag_Filt{str(fmin)}_{str(fmax)}.pdf")
print(output_file)
plt.tight_layout(pad=0.5)
plt.savefig(output_file, format="PDF", dpi=dpi, bbox_inches='tight')
plt.show()
plt.close()

