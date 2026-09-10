{palette}: ''
  :root {
    color-scheme: dark !important;
    --lwt-accent-color: ${palette.base03} !important;
    --lwt-text-color: ${palette.base07} !important;
    --toolbar-bgcolor: ${palette.base03} !important;
    --toolbar-color: ${palette.base07} !important;
    --toolbar-field-background-color: ${palette.base0C} !important;
    --toolbar-field-color: ${palette.base07} !important;
    --toolbar-field-focus-background-color: ${palette.base04} !important;
    --toolbar-field-focus-color: ${palette.base07} !important;
    --tab-selected-bgcolor: ${palette.base0E} !important;
    --tab-selected-textcolor: ${palette.base07} !important;
    --toolbarbutton-icon-fill: ${palette.base06} !important;
    --toolbarbutton-hover-background: ${palette.base0E} !important;
    --toolbarbutton-active-background: ${palette.base0C} !important;
    --chrome-content-separator-color: ${palette.base0A} !important;
    --panel-background: ${palette.base02} !important;
    --panel-color: ${palette.base07} !important;
    --arrowpanel-background: ${palette.base02} !important;
    --arrowpanel-color: ${palette.base07} !important;
    --focus-outline-color: ${palette.base0A} !important;
  }

  #navigator-toolbox,
  #titlebar,
  #TabsToolbar,
  #nav-bar,
  #PersonalToolbar,
  .browser-toolbar {
    background-color: ${palette.base03} !important;
    color: ${palette.base07} !important;
  }

  #navigator-toolbox {
    border-bottom: 1px solid ${palette.base0A} !important;
  }

  #PersonalToolbar {
    min-height: 28px !important;
    padding-block: 0 !important;
  }

  #PlacesToolbarItems > .bookmark-item {
    min-height: 24px !important;
    padding-block: 2px !important;
  }

  #urlbar-background {
    background-color: ${palette.base0C} !important;
    border-color: ${palette.base04} !important;
  }

  #urlbar[focused] > #urlbar-background,
  #urlbar[open] > #urlbar-background,
  #urlbar[breakout][breakout-extend] > #urlbar-background {
    background-color: ${palette.base04} !important;
    border-color: ${palette.base06} !important;
  }

  #urlbar[open] .urlbarView {
    background-color: ${palette.base04} !important;
    color: ${palette.base07} !important;
  }

  .tabbrowser-tab .tab-background {
    background-color: ${palette.base03} !important;
  }

  .tab-background[selected] {
    background-color: ${palette.base0E} !important;
  }

  .tabbrowser-tab .tab-label,
  #PlacesToolbarItems > .bookmark-item {
    color: ${palette.base07} !important;
  }

  menupopup,
  panel,
  panelview,
  .panel-arrowcontent {
    background-color: ${palette.base02} !important;
    color: ${palette.base07} !important;
  }
''
