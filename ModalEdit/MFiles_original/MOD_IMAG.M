if area_chosen == 1,
  figure(mod_all);
  tstart = floor((sscanf(get(time_from,'string'),'%f')-msec_offset)/dt) + 1;
  tend = ceil((sscanf(get(time_to,'string'),'%f')-msec_offset)/dt) + 1;
  if tstart < 1,
     tstart = 1;
  end;
  if tend > DispLen,
     tend = DispLen;
  end;
  fstart = floor((sscanf(get(freq_from,'string'),'%f'))/df) + 1;
  fend = ceil((sscanf(get(freq_to,'string'),'%f'))/df)+1;
  if fstart < 1,
     fstart = 1;
  end;
  if fend > TransLen,
     fend = TransLen;
  end;
  freqstart = (fstart-1)*df;
  freqend = (fend-1)*df;
  timestart = (tstart-1)*dt + msec_offset;
  timeend = (tend-1)*dt + msec_offset;
  set(time_from,'string',timestart);
  set(time_to,'string',timeend);
  set(freq_from,'string',freqstart);
  set(freq_to,'string',freqend);
  if log_displayed == 0,
     data_plot = data_in(fstart:fend,tstart:tend);
  elseif log_displayed ==1,
     data_plot = dbmtx(data_in(fstart:fend,tstart:tend),logrange,data_max);
  end;
  figure(mod_some);
  colormap gray;
  if max(max(data_plot)) == min(min(data_plot)),
     disp_error = errordlg('Not enough dB range','DISPLAY ERROR');
  else
    image(dt*[tstart:tend]'+msec_offset,[freqstart:df:freqend]',data_plot);
    dummy = colormap;
    colormap(1-dummy);
    clear dummy);
    axis('xy');
    ylabel('frequency, Hz');
    xlabel('time, msec');
    area_displayed = 1;
  end;
else
  mod_baby_err = errordlg('Must choose an area to display first','DISPLAY ERROR');
end;                    