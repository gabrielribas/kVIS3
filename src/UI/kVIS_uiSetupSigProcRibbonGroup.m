% kVIS3 Data Visualisation
%
% Copyright (C) 2012 - present  Kai Lehmkuehler, Matt Anderson and
% contributors
%
% Contact: kvis3@uav-flightresearch.com
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

function handles = kVIS_uiSetupSigProcRibbonGroup(handles, uiRibbonRight)

if ~nargin
    close all;
    kVIS3;
    return;
end

rbn = uix.HButtonBox('Parent', uiRibbonRight,...
    'HorizontalAlignment','left',...
    'Tag','tabSigProcRibbon',...
    'Backgroundcolor',handles.preferences.uiBackgroundColour);

handles.uiTabSigProc.axesFftLinearToggle = uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Linear',...
    'Value', 0,...
    'Callback',{@kVIS_sigProcAxesSelect_Callback, 0});

handles.uiTabSigProc.axesFftLogXToggle = uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Log X',...
    'Value', 0,...
    'Callback',{@kVIS_sigProcAxesSelect_Callback, 1});

handles.uiTabSigProc.axesFftLogYToggle = uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Log Y',...
    'Value', 0,...
    'Callback',{@kVIS_sigProcAxesSelect_Callback, 2});

handles.uiTabSigProc.axesFftLogLogToggle = uicontrol(rbn, 'Style', 'togglebutton',...
    'String','LogLog',...
    'Value', 0,...
    'Callback',{@kVIS_sigProcAxesSelect_Callback, 3});

uix.Empty('Parent', rbn);

uicontrol(rbn, 'Style', 'pushbutton',...
    'String','0..2 Hz',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uicontrol(rbn, 'Style', 'pushbutton',...
    'String','0..5 Hz',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uicontrol(rbn, 'Style', 'pushbutton',...
    'String','0..fs/2',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uicontrol(rbn, 'Style', 'pushbutton',...
    'String','Update',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uix.Empty('Parent', rbn);

uicontrol(rbn, 'Style', 'pushbutton',...
    'String','Legend',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Plot Exp',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uix.Empty('Parent', rbn);

uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Stats',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Filter',...
    'Callback',@tmp_Callback,...
    'Enable','off');

uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Delay',...
    'Callback',@tmp_Callback,...
    'Enable','off');

rbn.ButtonSize = [50 50];

end
