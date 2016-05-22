module Aui.Icons exposing (Icon(..), icon, iconSmall, iconLarge, rawIcon, Size, large, small)

{-| Functions to present AUI icons.


# Size

@docs Size, large, small

# Presentation

@docs icon, iconSmall, iconLarge, rawIcon

# Icon

@docs Icon

-}

import Html exposing (Html, span)
import Html.Attributes exposing (class)
import Regex exposing (regex, replace, HowMany(All))
import String exposing (toLower)


{-| Create an icon with an icon class that is not included in the api

    rawIcon small "aui-iconfont-add"
-}
rawIcon : Size -> String -> Html a
rawIcon size i =
    let
        sizeClass =
            if size == Large then
                "large"
            else
                "small"
    in
        span [ class ("aui-icon aui-icon-" ++ sizeClass ++ " " ++ i) ]
            []


{-| Create an icon with a given size and type.

    icon Small Configure
-}
icon : Size -> Icon -> Html a
icon size i =
    let
        sizeClass =
            if size == Large then
                "large"
            else
                "small"

        cl =
            icon2class i
    in
        span [ class ("aui-icon aui-icon-" ++ sizeClass ++ " aui-iconfont" ++ cl) ]
            []


{-| Shortcut for `icon Small`
-}
iconSmall : Icon -> Html a
iconSmall =
    icon Small


{-| Shortcut for `icon Large`
-}
iconLarge : Icon -> Html a
iconLarge =
    icon Large


icon2class : Icon -> String
icon2class i =
    toString i
        |> replace All
            (regex "[A-Z0-9]")
            (\match -> "-" ++ toLower match.match)


{-| Sizes for icon
-}
type Size
    = Large
    | Small


{-| Large sized icon
-}
large : Size
large =
    Large


{-| Small sized icon
-}
small : Size
small =
    Small


{-| Available icon types. See official configuration for icon names. For all icon names the following convention is applied: from `add-comment` to `AddComment`
-}
type Icon
    = Add
    | AddComment
    | AddSmall
    | Approve
    | Appswitcher
    | ArrowsDown
    | ArrowsLeft
    | ArrowsRight
    | ArrowsUp
    | Attachment
    | AttachmentSmall
    | AutocompleteDate
    | BackPage
    | Blogroll
    | BpDecisions
    | BpDefault
    | BpFiles
    | BpRequirements
    | BpHowto
    | BpJira
    | BpMeeting
    | BpRetrospective
    | BpSharedlinks
    | BpTroubleshooting
    | Build
    | Calendar
    | CloseDialog
    | Collapsed
    | Comment
    | Configure
    | Confluence
    | CopyClipboard
    | CustomBullet
    | Delete
    | Deploy
    | Details
    | Doc
    | Down
    | DragVertical
    | Edit
    | EditSmall
    | Email
    | Error
    | Expanded
    | FileCode
    | FileDoc
    | FileJava
    | FilePdf
    | FilePpt
    | FileTxt
    | FileWav
    | FileXls
    | FileZip
    | Flag
    | Focus
    | Group
    | HandleHorizontal
    | Help
    | Hipchat
    | Homepage
    | Image
    | ImageExtrasmall
    | ImageSmall
    | Info
    | Like
    | LikeSmall
    | Weblink
    | Link
    | ListAdd
    | ListRemove
    | Locked
    | LockedSmall
    | MacroCode
    | MacroDefault
    | MacroGallery
    | MacroStatus
    | More
    | NavChildren
    | PageBlank
    | PageBlogpost
    | PageDefault
    | PageTemplate
    | Pages
    | Quote
    | Redo
    | Remove
    | RemoveLabel
    | Review
    | Rss
    | Search
    | SearchSmall
    | Share
    | SidebarLink
    | Sourcetree
    | SpaceDefault
    | SpacePersonal
    | Star
    | Success
    | TableBg
    | TableColLeft
    | TableColRemove
    | TableColRight
    | TableCopyRow
    | TableCutRow
    | TableHeaderColumn
    | TableHeaderRow
    | TableMerge
    | TableNoBg
    | TablePasteRow
    | TableRemove
    | TableRowDown
    | TableRowRemove
    | TableRowUp
    | TableSplit
    | Teamcals
    | Time
    | Undo
    | Unfocus
    | Unlocked
    | Unstar
    | Unwatch
    | Up
    | User
    | UserStatus
    | View
    | ViewCard
    | ViewList
    | ViewTable
    | Warning
    | Watch
    | Workbox
    | WorkboxEmpty
    | ConfigureColumns
    | Export
    | ExportList
    | FileImage
    | AdminFusion
    | AdminJiraFields
    | AdminIssue
    | AdminNotifications
    | AdminRoles
    | AdminJiraScreens
    | Pause
    | PriorityHighest
    | PriorityHigh
    | PriorityMedium
    | PriorityLow
    | PriorityLowest
    | RefreshSmall
    | ShareList
    | SwitchSmall
    | Version
    | Workflow
    | AdminJiraSettings
    | Component
    | Reopen
    | Roadmap
    | DeploySuccess
    | DeployFail
    | FileGeneric
    | ArrowDown
    | ArrowUp
    | FileVideo
    | BlogrollLarge
    | EmailLarge
    | Layout1colLarge
    | Layout2colLarge
    | Layout2colLeftLarge
    | Layout2colRightLarge
    | Layout3colCenterLarge
    | Layout3colLarge
    | NavChildrenLarge
    | PagesLarge
    | SidebarLinkLarge
    | TeamcalsLarge
    | UserLarge
    | JiraIssues
    | DevtoolsArrowLeft
    | DevtoolsArrowRight
    | DevtoolsBranch
    | DevtoolsBranchSmall
    | DevtoolsBrowseUp
    | DevtoolsCheckout
    | DevtoolsClone
    | DevtoolsCommit
    | DevtoolsCompare
    | DevtoolsFile
    | DevtoolsFileBinary
    | DevtoolsFileCommented
    | DevtoolsFolderClosed
    | DevtoolsFolderOpen
    | DevtoolsFork
    | DevtoolsPullRequest
    | DevtoolsRepository
    | DevtoolsRepositoryForked
    | DevtoolsRepositoryLocked
    | DevtoolsSideDiff
    | DevtoolsSubmodule
    | DevtoolsTag
    | DevtoolsTagSmall
    | DevtoolsTaskCancelled
    | DevtoolsTaskDisabled
    | DevtoolsTaskInProgress
    | Bitbucket
    | EditorAlignCenter
    | EditorAlignLeft
    | EditorAlignRight
    | EditorBold
    | EditorColor
    | EditorEmoticon
    | EditorHelp
    | EditorHr
    | EditorIndent
    | EditorItalic
    | EditorLayout
    | EditorListBullet
    | EditorListNumber
    | EditorMacroToc
    | EditorMention
    | EditorOutdent
    | EditorStyles
    | EditorSymbol
    | EditorTable
    | EditorTask
    | EditorUnderline
    | Jira
    | JiraCompletedTask
    | JiraTestSession
