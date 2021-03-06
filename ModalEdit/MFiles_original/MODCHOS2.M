if file_named == 1,
  [x,y] = ginput(2);
  if x(1) > x(2),
        temp = x(1);
        x(1) = x(2);
        x(2) = temp;
  end;% if x
  tstart = max(ceil((x(1)-msec_offset)/dt),1);
  tend = min(floor((x(2)-msec_offset)/dt),DispLen);
  %  if x(2) > xdisp(length(xdisp)),
  %     tend = DispLen;
  %end;
  if y(1) > y(2),
        temp = y(1);
        y(1) = y(2);
        y(2) = y(1);
  end;% if y
  fstart = ceil((max(ceil(y(1)),0))/df) + 1;
  fend = floor((min(ceil(y(2)),(TransLen-1)*df))/df) + 1;
  freqstart = (fstart-1)*df;
  freqend = (fend-1)*df;
  timestart = (tstart-1)*dt + msec_offset;
  timeend = (tend-1)*dt + msec_offset;
  s1t = sprintf('%3.2f',timestart);
  s1f = sprintf('%3.2f',freqstart);
  s2t = sprintf('%3.2f',timeend);
  s2f = sprintf('%3.2f',freqend);
  set(time_from,'string',s1t);
  set(time_to,'string',s2t);
  set(freq_from,'string',s1f);
  set(freq_to,'string',s2f);
  if (tstart == tend) | (fstart == fend),
        errchoice = errordlg('start and end positions in both time and frequency axis must not be equal','ERROR', ...
                'on');
  end; %if (tstart
  data_plot = data_in(fstart:fend,tstart:tend);
  area_chosen = 1;
else
  modchose_err = errordlg('Must open a file first','ERROR');
end;                                                            
                                                          