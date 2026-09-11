{palette}: ''
  :root {
    color-scheme: dark !important;
    --lwt-accent-color: ${palette.base03} !important;
    --lwt-accent-color-inactive: ${palette.base02} !important;
    --lwt-text-color: ${palette.base07} !important;
    --toolbox-background-color: ${palette.base03} !important;
    --toolbox-background-color-inactive: ${palette.base02} !important;
    --toolbox-text-color: ${palette.base07} !important;
    --toolbox-text-color-inactive: ${palette.base06} !important;
    --toolbar-bgcolor: ${palette.base0E} !important;
    --toolbar-background-color: ${palette.base0E} !important;
    --toolbar-color: ${palette.base07} !important;
    --toolbar-text-color: ${palette.base07} !important;
    --toolbar-field-background-color: ${palette.base0C} !important;
    --toolbar-field-background-color-focus: ${palette.base04} !important;
    --toolbar-field-color: ${palette.base07} !important;
    --toolbar-field-text-color: ${palette.base07} !important;
    --toolbar-field-focus-background-color: ${palette.base04} !important;
    --toolbar-field-focus-color: ${palette.base07} !important;
    --toolbar-field-text-color-focus: ${palette.base07} !important;
    --toolbar-field-border-color: ${palette.base04} !important;
    --toolbar-field-border-color-focus: ${palette.base06} !important;
    --toolbar-field-focus-border-color: ${palette.base06} !important;
    --tab-background-color: transparent !important;
    --tab-background-color-hover: ${palette.base0E} !important;
    --tab-background-color-selected: ${palette.base0C} !important;
    --tab-hover-outline-color: ${palette.base04} !important;
    --tab-selected-outline-color: ${palette.base0D} !important;
    --tab-box-shadow-selected: none !important;
    --tab-selected-bgcolor: ${palette.base0C} !important;
    --tab-selected-textcolor: ${palette.base07} !important;
    --toolbarbutton-icon-fill: ${palette.base06} !important;
    --toolbarbutton-icon-fill-attention: ${palette.base0A} !important;
    --toolbarbutton-background-color-hover: ${palette.base0C} !important;
    --toolbarbutton-background-color-active: ${palette.base04} !important;
    --toolbarbutton-hover-background: ${palette.base0C} !important;
    --toolbarbutton-active-background: ${palette.base04} !important;
    --panel-background-color: ${palette.base0E} !important;
    --panel-text-color: ${palette.base07} !important;
    --panel-border-color: ${palette.base04} !important;
    --panel-item-hover-bgcolor: ${palette.base0C} !important;
    --panel-item-active-bgcolor: ${palette.base04} !important;
    --panel-separator-color: ${palette.base04} !important;
    --arrowpanel-background: ${palette.base0E} !important;
    --arrowpanel-color: ${palette.base07} !important;
    --arrowpanel-border-color: ${palette.base04} !important;
    --sidebar-background-color: ${palette.base0E} !important;
    --sidebar-text-color: ${palette.base07} !important;
    --sidebar-border-color: ${palette.base04} !important;
    --urlbarview-background-color-hover: ${palette.base0C} !important;
    --urlbarview-background-color-selected: ${palette.base0E} !important;
    --urlbarview-text-color-selected: ${palette.base07} !important;
    --urlbarview-text-color-action: ${palette.base0A} !important;
    --urlbarview-text-color-secondary: ${palette.base06} !important;
    --chrome-content-separator-color: ${palette.base04} !important;
    --focus-outline-color: ${palette.base0A} !important;
  }

  #navigator-toolbox,
  #titlebar,
  #toolbar-menubar,
  #TabsToolbar {
    background-color: ${palette.base03} !important;
    color: ${palette.base07} !important;
  }

  #nav-bar,
  #PersonalToolbar {
    background-color: ${palette.base0E} !important;
    color: ${palette.base07} !important;
  }

  #navigator-toolbox {
    border-bottom: 1px solid ${palette.base04} !important;
  }

  #PersonalToolbar {
    min-height: 28px !important;
    padding-block: 0 !important;
  }

  #PlacesToolbarItems > .bookmark-item {
    min-height: 24px !important;
    padding-block: 2px !important;
    color: ${palette.base06} !important;
  }

  #PlacesToolbarItems > .bookmark-item:hover {
    background-color: ${palette.base0C} !important;
    color: ${palette.base07} !important;
  }

  #PlacesToolbarItems > .bookmark-item:is(:active, [open]) {
    background-color: ${palette.base04} !important;
  }

  #urlbar,
  #searchbar {
    --urlbar-background-color: ${palette.base0C} !important;
    --urlbar-background-color-focus: ${palette.base04} !important;
    --urlbarview-background-color-hover: ${palette.base0C} !important;
    --urlbarview-background-color-selected: ${palette.base0E} !important;
    --urlbarview-text-color-selected: ${palette.base07} !important;
    --urlbarview-text-color-action: ${palette.base0A} !important;
    --urlbarview-text-color-secondary: ${palette.base06} !important;
  }

  #urlbar-background,
  #searchbar {
    background-color: ${palette.base0C} !important;
    border-color: ${palette.base04} !important;
  }

  #urlbar:is([focused], [open]) > #urlbar-background,
  #urlbar[breakout][breakout-extend] > #urlbar-background,
  #searchbar:focus-within {
    background-color: ${palette.base04} !important;
    border-color: ${palette.base06} !important;
  }

  #urlbar[open] .urlbarView {
    background-color: ${palette.base04} !important;
    color: ${palette.base07} !important;
  }

  .urlbarView-row[context-menu-trigger],
  .urlbarView-row[row-selectable]:not([selected]):hover {
    background-color: ${palette.base0C} !important;
  }

  .urlbarView-row[selected] {
    background-color: ${palette.base0E} !important;
    color: ${palette.base07} !important;
  }

  .urlbarView-row:not([selected]) :is(.urlbarView-url, .urlbarView-action) {
    color: ${palette.base06} !important;
  }

  .tabbrowser-tab {
    --tab-background-color: transparent !important;
    --tab-background-color-hover: ${palette.base0E} !important;
    --tab-background-color-selected: ${palette.base0C} !important;
    --tab-hover-outline-color: ${palette.base04} !important;
    --tab-selected-outline-color: ${palette.base0D} !important;
    --tab-box-shadow-selected: none !important;
  }

  .tabbrowser-tab:not([selected], [multiselected]) > .tab-stack > .tab-background {
    background-color: transparent !important;
    outline: 1px solid transparent !important;
    outline-offset: -1px !important;
    box-shadow: none !important;
  }

  .tabbrowser-tab:not([selected], [multiselected]):hover > .tab-stack > .tab-background {
    background-color: ${palette.base0E} !important;
    outline-color: ${palette.base04} !important;
  }

  .tabbrowser-tab:is([selected], [multiselected]) > .tab-stack > .tab-background,
  .tab-background:is([selected], [multiselected]) {
    background-color: ${palette.base0C} !important;
    outline: 1px solid ${palette.base0D} !important;
    outline-offset: -1px !important;
    box-shadow: none !important;
  }

  .tabbrowser-tab:not([selected], [multiselected]) .tab-label {
    color: ${palette.base06} !important;
  }

  .tabbrowser-tab:is([selected], [multiselected]) .tab-label {
    color: ${palette.base07} !important;
  }

  :is(menupopup, panel) {
    --panel-background-color: ${palette.base0E} !important;
    --panel-text-color: ${palette.base07} !important;
    --panel-border-color: ${palette.base04} !important;
    color: ${palette.base07} !important;
  }

  :is(menupopup, panel)::part(content) {
    background-color: ${palette.base0E} !important;
    border-color: ${palette.base04} !important;
    color: ${palette.base07} !important;
  }

  panelview,
  .panel-subview-body,
  .panel-arrowcontent {
    background-color: ${palette.base0E} !important;
    color: ${palette.base07} !important;
  }

  :is(menu, menuitem):is([_moz-menuactive], [menuactive]),
  .subviewbutton:hover {
    background-color: ${palette.base0C} !important;
    color: ${palette.base07} !important;
  }

  #sidebar-container,
  #sidebar-box,
  #sidebar,
  #sidebar-header {
    background-color: ${palette.base0E} !important;
    color: ${palette.base07} !important;
  }

  #sidebar-header {
    border-bottom-color: ${palette.base04} !important;
  }

  findbar,
  .findbar-container {
    background-color: ${palette.base0E} !important;
    color: ${palette.base07} !important;
    border-top-color: ${palette.base04} !important;
  }

  findbar .findbar-textbox {
    background-color: ${palette.base0C} !important;
    border-color: ${palette.base04} !important;
    color: ${palette.base07} !important;
  }

  #statuspanel-label {
    background-color: ${palette.base0E} !important;
    border-color: ${palette.base04} !important;
    color: ${palette.base07} !important;
  }
''
