--- @alias VSCodeColors table
--- @field None string
--- @field Front string
--- @field Back string
--- @field BackDarker string
--- @field TabCurrent string
--- @field TabOther string
--- @field TabOutside string
--- @field LeftDark string
--- @field LeftMid string
--- @field LeftLight string
--- @field PopupFront string
--- @field PopupBack string
--- @field PopupHighlightBlue string
--- @field PopupHighlightGray string
--- @field SplitLight string
--- @field SplitDark string
--- @field SplitThumb string
--- @field CursorDarkDark string
--- @field CursorDark string
--- @field CursorLight string
--- @field Selection string
--- @field LineNumber string
--- @field DiffRedDark string
--- @field DiffRedLight string
--- @field DiffRedLightLight string
--- @field DiffGreenDark string
--- @field DiffGreenLight string
--- @field SearchCurrent string
--- @field Search string
--- @field GitAdded string
--- @field GitModified string
--- @field GitDeleted string
--- @field GitRenamed string
--- @field GitUntracked string
--- @field GitIgnored string
--- @field GitStageModified string
--- @field GitStageDeleted string
--- @field GitConflicting string
--- @field GitSubmodule string
--- @field Context string
--- @field ContextCurrent string
--- @field FoldBackground string
--- @field Suggestion string
--- @field Gray string
--- @field Violet string
--- @field Blue string
--- @field AccentBlue string
--- @field DarkBlue string
--- @field MediumBlue string
--- @field DisabledBlue string
--- @field LightBlue string
--- @field Green string
--- @field BlueGreen string
--- @field LightGreen string
--- @field Red string
--- @field Orange string
--- @field LightRed string
--- @field YellowOrange string
--- @field Yellow string
--- @field DarkYellow string
--- @field Pink string
--- @field DimHighlight string
local vsc = {
  None = "NONE",
  Front = "#D4D4D4",
  Back = "#1F1F1F",
  BackDarker = "#181818",
  TabCurrent = "#1F1F1F",
  TabOther = "#2D2D2D",
  TabOutside = "#252526",
  LeftDark = "#252526",
  LeftMid = "#373737",
  LeftLight = "#636369",
  PopupFront = "#BBBBBB",
  PopupBack = "#202020",
  PopupHighlightBlue = "#04395E",
  PopupHighlightGray = "#343B41",
  SplitLight = "#898989",
  SplitDark = "#444444",
  SplitThumb = "#424242",
  CursorDarkDark = "#222222",
  CursorDark = "#51504F",
  CursorLight = "#AEAFAD",
  Selection = "#264F78",
  LineNumber = "#5A5A5A",
  DiffRedDark = "#4B1818",
  DiffRedLight = "#6F1313",
  DiffRedLightLight = "#FB0101",
  DiffGreenDark = "#373D29",
  DiffGreenLight = "#4B5632",
  SearchCurrent = "#515c6a",
  Search = "#613315",
  GitAdded = "#81b88b",
  GitModified = "#e2c08d",
  GitDeleted = "#c74e39",
  GitRenamed = "#73c991",
  GitUntracked = "#73c991",
  GitIgnored = "#8c8c8c",
  GitStageModified = "#e2c08d",
  GitStageDeleted = "#c74e39",
  GitConflicting = "#e4676b",
  GitSubmodule = "#8db9e2",
  Context = "#404040",
  ContextCurrent = "#707070",
  FoldBackground = "#202d39",
  Suggestion = "#6A6A6A",
  -- Syntax colors
  Gray = "#808080",
  Violet = "#646695",
  Blue = "#569CD6",
  AccentBlue = "#4FC1FF",
  DarkBlue = "#223E55",
  MediumBlue = "#18a2fe",
  DisabledBlue = "#729DB3",
  LightBlue = "#9CDCFE",
  Green = "#6A9955",
  BlueGreen = "#4EC9B0",
  LightGreen = "#B5CEA8",
  Red = "#F44747",
  Orange = "#CE9178",
  LightRed = "#D16969",
  YellowOrange = "#D7BA7D",
  Yellow = "#DCDCAA",
  DarkYellow = "#FFD602",
  Pink = "#C586C0",
  -- Low contrast with default background
  DimHighlight = "#51504F",
}

--- @type VSCodeColors
return vsc
