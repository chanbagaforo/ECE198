fig_query = uicontrol(mod_some,'style','edit',...
	'position',[200 470 100 20],...
	'BackGroundColor','white',...
	'string','Figure Label:');
fig_label = uicontrol(mod_some,'style','edit',...
	'BackGroundColor','white',...
	'position',[302 470 150 20]);
fig_but1 = uicontrol(mod_some,'style','pushbutton',...
	'position',[200 445 40 20],...
	'string','OK','callback','labelok');
fig_but2 = uicontrol(mod_some,'style','pushbutton',...
	'position',[240 445 70 20],...
	'string','CANCEL','callback','labelcan');
