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

function handles = kVIS_uiSetupDataViewerRibbonGroup(handles, uiRibbonRight)

if ~nargin
    close all;
    kVIS3;
    return;
end

rbn = uix.HButtonBox('Parent', uiRibbonRight,...
    'HorizontalAlignment','left',...
    'Tag','tabDataViewerRibbon',...
    'Backgroundcolor',handles.preferences.uiBackgroundColour);



uicontrol(rbn, 'Style', 'pushbutton',...
    'String', '+plot',...
    'TooltipString','Add Axes',...
    'Value', 0,...
    'Callback',@kVIS_addPlotAxes_Callback);

uicontrol(rbn, 'Style', 'pushbutton',...
    'String', '+column',...
    'TooltipString','Add Column',...
    'Value', 0,...
    'Callback',@kVIS_addPlotColumn_Callback);

uicontrol(rbn, 'Style', 'pushbutton',...
    'String', 'clear',...
    'TooltipString','Clear layout',...
    'Value', 0,...
    'Callback',@kVIS_clearPlotLayout_Callback);



% handles.uiTabDataViewer.axesLeftToggle = uicontrol(rbn, 'Style', 'togglebutton',...
%     'CData', imread('left_ax.png'),...
%     'TooltipString','Main Axes Left',...
%     'Value', 0,...
%     'Callback',{@kVIS_dataViewerAxesSelect_Callback, 0});
% 
% handles.uiTabDataViewer.axesRightToggle = uicontrol(rbn, 'Style', 'togglebutton',...
%     'CData', imread('right_ax.png'),...
%     'TooltipString','Main Axes Right',...
%     'Value', 0,...
%     'Callback',{@kVIS_dataViewerAxesSelect_Callback, 1});
% 
% handles.uiTabDataViewer.axesTopToggle = uicontrol(rbn, 'Style', 'togglebutton',...
%     'CData', imread('top_ax.png'),...
%     'TooltipString','Top Axes',...
%     'Value', 0,...
%     'Callback',{@kVIS_dataViewerAxesSelect_Callback, 2});
% 
% handles.uiTabDataViewer.axesTop2Toggle = uicontrol(rbn, 'Style', 'togglebutton',...
%     'CData', imread('top_ax.png'),...
%     'TooltipString','Top Axes Mode Style',...
%     'Value', 0,...
%     'Callback',{@kVIS_dataViewerAxesSelect_Callback, 3},...
%     'Enable', 'off');


uix.Empty('Parent', rbn);

uicontrol(rbn, 'Style', 'pushbutton',...
    'String','Plot Exp',...
    'Callback',@kVIS_dataViewerExportPlot);

uix.Empty('Parent', rbn);


uicontrol(rbn, 'Style', 'togglebutton',...
    'CData', imread('show_events.png'),...
    'TooltipString','Show Event boundaries in Plot',...
    'Tag', 'showEventsToggle', ...
    'Callback',@kVIS_showEvents_Callback);

handles.uiTabDataViewer.showEvents = [];

% uicontrol(rbn, 'Style', 'pushbutton',...
%     'CData', imread('icons8-waypoint-map-36.png'),...
%     'TooltipString','Map plot',...
%     'Callback',@kVIS_createMap_Callback);

uix.Empty('Parent', rbn);

uicontrol(rbn, 'Style', 'pushbutton',...
    'CData', imread('icons8-cut-36.png'),...
    'TooltipString','Trim Timeline',...
    'Callback',@kVIS_editTimeline_Callback);


uix.Empty('Parent', rbn);

uicontrol(rbn, 'Style', 'pushbutton',...
    'CData', imread('icons8-map-pin-36.png'),...
    'TooltipString','Set Time Reference',...
    'Callback',@tmp_Callback,...
    'Enable', 'off');

uicontrol(rbn, 'Style', 'pushbutton',...
    'CData', imread('icons8-map-pinpoint-36.png'),...
    'TooltipString','Time Offset',...
    'Callback',@tmp_Callback,...
    'Enable', 'off');

uicontrol(rbn, 'Style', 'togglebutton',...
    'String','Zero time','TooltipString','Remove Time Offset',...
    'Callback',@kVIS_zeroTimeBtn_Callback,...
    'Enable','off');

rbn.ButtonSize = [50 50];

end
