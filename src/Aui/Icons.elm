module Aui.Icons exposing (Icon, customIcon, icon, iconSmall, iconLarge, Size, large, small, addIcon, addCommentIcon, addSmallIcon, approveIcon, appswitcherIcon, arrowsDownIcon, arrowsLeftIcon, arrowsRightIcon, arrowsUpIcon, attachmentIcon, attachmentSmallIcon, autocompleteDateIcon, backPageIcon, blogrollIcon, bpDecisionsIcon, bpDefaultIcon, bpFilesIcon, bpRequirementsIcon, bpHowtoIcon, bpJiraIcon, bpMeetingIcon, bpRetrospectiveIcon, bpSharedlinksIcon, bpTroubleshootingIcon, buildIcon, calendarIcon, closeDialogIcon, collapsedIcon, commentIcon, configureIcon, confluenceIcon, copyClipboardIcon, customBulletIcon, deleteIcon, deployIcon, detailsIcon, docIcon, downIcon, dragVerticalIcon, editIcon, editSmallIcon, emailIcon, errorIcon, expandedIcon, fileCodeIcon, fileDocIcon, fileJavaIcon, filePdfIcon, filePptIcon, fileTxtIcon, fileWavIcon, fileXlsIcon, fileZipIcon, flagIcon, focusIcon, groupIcon, handleHorizontalIcon, helpIcon, hipchatIcon, homepageIcon, imageIcon, imageExtrasmallIcon, imageSmallIcon, infoIcon, likeIcon, likeSmallIcon, weblinkIcon, linkIcon, listAddIcon, listRemoveIcon, lockedIcon, lockedSmallIcon, macroCodeIcon, macroDefaultIcon, macroGalleryIcon, macroStatusIcon, moreIcon, navChildrenIcon, pageBlankIcon, pageBlogpostIcon, pageDefaultIcon, pageTemplateIcon, pagesIcon, quoteIcon, redoIcon, removeIcon, removeLabelIcon, reviewIcon, rssIcon, searchIcon, searchSmallIcon, shareIcon, sidebarLinkIcon, sourcetreeIcon, spaceDefaultIcon, spacePersonalIcon, starIcon, successIcon, tableBgIcon, tableColLeftIcon, tableColRemoveIcon, tableColRightIcon, tableCopyRowIcon, tableCutRowIcon, tableHeaderColumnIcon, tableHeaderRowIcon, tableMergeIcon, tableNoBgIcon, tablePasteRowIcon, tableRemoveIcon, tableRowDownIcon, tableRowRemoveIcon, tableRowUpIcon, tableSplitIcon, teamcalsIcon, timeIcon, undoIcon, unfocusIcon, unlockedIcon, unstarIcon, unwatchIcon, upIcon, userIcon, userStatusIcon, viewIcon, viewCardIcon, viewListIcon, viewTableIcon, warningIcon, watchIcon, workboxIcon, workboxEmptyIcon, configureColumnsIcon, exportIcon, exportListIcon, fileImageIcon, adminFusionIcon, adminJiraFieldsIcon, adminIssueIcon, adminNotificationsIcon, adminRolesIcon, adminJiraScreensIcon, pauseIcon, priorityHighestIcon, priorityHighIcon, priorityMediumIcon, priorityLowIcon, priorityLowestIcon, refreshSmallIcon, shareListIcon, switchSmallIcon, versionIcon, workflowIcon, adminJiraSettingsIcon, componentIcon, reopenIcon, roadmapIcon, deploySuccessIcon, deployFailIcon, fileGenericIcon, arrowDownIcon, arrowUpIcon, fileVideoIcon, blogrollLargeIcon, emailLargeIcon, layout1ColLargeIcon, layout2ColLargeIcon, layout2ColLeftLargeIcon, layout2ColRightLargeIcon, layout3ColCenterLargeIcon, layout3ColLargeIcon, navChildrenLargeIcon, pagesLargeIcon, sidebarLinkLargeIcon, teamcalsLargeIcon, userLargeIcon, jiraIssuesIcon, devtoolsArrowLeftIcon, devtoolsArrowRightIcon, devtoolsBranchIcon, devtoolsBranchSmallIcon, devtoolsBrowseUpIcon, devtoolsCheckoutIcon, devtoolsCloneIcon, devtoolsCommitIcon, devtoolsCompareIcon, devtoolsFileIcon, devtoolsFileBinaryIcon, devtoolsFileCommentedIcon, devtoolsFolderClosedIcon, devtoolsFolderOpenIcon, devtoolsForkIcon, devtoolsPullRequestIcon, devtoolsRepositoryIcon, devtoolsRepositoryForkedIcon, devtoolsRepositoryLockedIcon, devtoolsSideDiffIcon, devtoolsSubmoduleIcon, devtoolsTagIcon, devtoolsTagSmallIcon, devtoolsTaskCancelledIcon, devtoolsTaskDisabledIcon, devtoolsTaskInProgressIcon, bitbucketIcon, editorAlignCenterIcon, editorAlignLeftIcon, editorAlignRightIcon, editorBoldIcon, editorColorIcon, editorEmoticonIcon, editorHelpIcon, editorHrIcon, editorIndentIcon, editorItalicIcon, editorLayoutIcon, editorListBulletIcon, editorListNumberIcon, editorMacroTocIcon, editorMentionIcon, editorOutdentIcon, editorStylesIcon, editorSymbolIcon, editorTableIcon, editorTaskIcon, editorUnderlineIcon, jiraIcon, jiraCompletedTaskIcon, jiraTestSessionIcon)

{-| Functions to present AUI icons.


# Types

@docs Icon, customIcon, Size, large, small

# Presentation

@docs icon, iconSmall, iconLarge

# Predefined Icons

@docs addIcon, addCommentIcon, addSmallIcon, approveIcon, appswitcherIcon, arrowsDownIcon, arrowsLeftIcon, arrowsRightIcon, arrowsUpIcon, attachmentIcon, attachmentSmallIcon, autocompleteDateIcon, backPageIcon, blogrollIcon, bpDecisionsIcon, bpDefaultIcon, bpFilesIcon, bpRequirementsIcon, bpHowtoIcon, bpJiraIcon, bpMeetingIcon, bpRetrospectiveIcon, bpSharedlinksIcon, bpTroubleshootingIcon, buildIcon, calendarIcon, closeDialogIcon, collapsedIcon, commentIcon, configureIcon, confluenceIcon, copyClipboardIcon, customBulletIcon, deleteIcon, deployIcon, detailsIcon, docIcon, downIcon, dragVerticalIcon, editIcon, editSmallIcon, emailIcon, errorIcon, expandedIcon, fileCodeIcon, fileDocIcon, fileJavaIcon, filePdfIcon, filePptIcon, fileTxtIcon, fileWavIcon, fileXlsIcon, fileZipIcon, flagIcon, focusIcon, groupIcon, handleHorizontalIcon, helpIcon, hipchatIcon, homepageIcon, imageIcon, imageExtrasmallIcon, imageSmallIcon, infoIcon, likeIcon, likeSmallIcon, weblinkIcon, linkIcon, listAddIcon, listRemoveIcon, lockedIcon, lockedSmallIcon, macroCodeIcon, macroDefaultIcon, macroGalleryIcon, macroStatusIcon, moreIcon, navChildrenIcon, pageBlankIcon, pageBlogpostIcon, pageDefaultIcon, pageTemplateIcon, pagesIcon, quoteIcon, redoIcon, removeIcon, removeLabelIcon, reviewIcon, rssIcon, searchIcon, searchSmallIcon, shareIcon, sidebarLinkIcon, sourcetreeIcon, spaceDefaultIcon, spacePersonalIcon, starIcon, successIcon, tableBgIcon, tableColLeftIcon, tableColRemoveIcon, tableColRightIcon, tableCopyRowIcon, tableCutRowIcon, tableHeaderColumnIcon, tableHeaderRowIcon, tableMergeIcon, tableNoBgIcon, tablePasteRowIcon, tableRemoveIcon, tableRowDownIcon, tableRowRemoveIcon, tableRowUpIcon, tableSplitIcon, teamcalsIcon, timeIcon, undoIcon, unfocusIcon, unlockedIcon, unstarIcon, unwatchIcon, upIcon, userIcon, userStatusIcon, viewIcon, viewCardIcon, viewListIcon, viewTableIcon, warningIcon, watchIcon, workboxIcon, workboxEmptyIcon, configureColumnsIcon, exportIcon, exportListIcon, fileImageIcon, adminFusionIcon, adminJiraFieldsIcon, adminIssueIcon, adminNotificationsIcon, adminRolesIcon, adminJiraScreensIcon, pauseIcon, priorityHighestIcon, priorityHighIcon, priorityMediumIcon, priorityLowIcon, priorityLowestIcon, refreshSmallIcon, shareListIcon, switchSmallIcon, versionIcon, workflowIcon, adminJiraSettingsIcon, componentIcon, reopenIcon, roadmapIcon, deploySuccessIcon, deployFailIcon, fileGenericIcon, arrowDownIcon, arrowUpIcon, fileVideoIcon, blogrollLargeIcon, emailLargeIcon, layout1ColLargeIcon, layout2ColLargeIcon, layout2ColLeftLargeIcon, layout2ColRightLargeIcon, layout3ColCenterLargeIcon, layout3ColLargeIcon, navChildrenLargeIcon, pagesLargeIcon, sidebarLinkLargeIcon, teamcalsLargeIcon, userLargeIcon, jiraIssuesIcon, devtoolsArrowLeftIcon, devtoolsArrowRightIcon, devtoolsBranchIcon, devtoolsBranchSmallIcon, devtoolsBrowseUpIcon, devtoolsCheckoutIcon, devtoolsCloneIcon, devtoolsCommitIcon, devtoolsCompareIcon, devtoolsFileIcon, devtoolsFileBinaryIcon, devtoolsFileCommentedIcon, devtoolsFolderClosedIcon, devtoolsFolderOpenIcon, devtoolsForkIcon, devtoolsPullRequestIcon, devtoolsRepositoryIcon, devtoolsRepositoryForkedIcon, devtoolsRepositoryLockedIcon, devtoolsSideDiffIcon, devtoolsSubmoduleIcon, devtoolsTagIcon, devtoolsTagSmallIcon, devtoolsTaskCancelledIcon, devtoolsTaskDisabledIcon, devtoolsTaskInProgressIcon, bitbucketIcon, editorAlignCenterIcon, editorAlignLeftIcon, editorAlignRightIcon, editorBoldIcon, editorColorIcon, editorEmoticonIcon, editorHelpIcon, editorHrIcon, editorIndentIcon, editorItalicIcon, editorLayoutIcon, editorListBulletIcon, editorListNumberIcon, editorMacroTocIcon, editorMentionIcon, editorOutdentIcon, editorStylesIcon, editorSymbolIcon, editorTableIcon, editorTaskIcon, editorUnderlineIcon, jiraIcon, jiraCompletedTaskIcon, jiraTestSessionIcon

-}

import Html exposing (Html, span)
import Html.Attributes exposing (class)
import Regex exposing (regex, replace, HowMany(All))
import String exposing (toLower)


{-| Opaque icon type
-}
type Icon
    = Icon String


{-| Create an icon with a custom icon class. You loose the safety that you have with the predefined icons.
    Only use this when there are new items that are not yet predefined.

    customIcon "my-custom-icon"
-}
customIcon : String -> Icon
customIcon =
    Icon


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


{-| Create an icon with a given size and type.

    icon Small Configure
-}
icon : Size -> Icon -> Html a
icon size (Icon cl) =
    let
        sizeClass =
            if size == Large then
                "large"
            else
                "small"


    in
        span [ class ("aui-icon aui-icon-" ++ sizeClass ++ " aui-iconfont-" ++ cl) ]
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


{-| Predefined icon for add
-}
addIcon : Icon
addIcon =
    Icon "add"


{-| Predefined icon for add-comment
-}
addCommentIcon : Icon
addCommentIcon =
    Icon "add-comment"


{-| Predefined icon for add-small
-}
addSmallIcon : Icon
addSmallIcon =
    Icon "add-small"


{-| Predefined icon for approve
-}
approveIcon : Icon
approveIcon =
    Icon "approve"


{-| Predefined icon for appswitcher
-}
appswitcherIcon : Icon
appswitcherIcon =
    Icon "appswitcher"


{-| Predefined icon for arrows-down
-}
arrowsDownIcon : Icon
arrowsDownIcon =
    Icon "arrows-down"


{-| Predefined icon for arrows-left
-}
arrowsLeftIcon : Icon
arrowsLeftIcon =
    Icon "arrows-left"


{-| Predefined icon for arrows-right
-}
arrowsRightIcon : Icon
arrowsRightIcon =
    Icon "arrows-right"


{-| Predefined icon for arrows-up
-}
arrowsUpIcon : Icon
arrowsUpIcon =
    Icon "arrows-up"


{-| Predefined icon for attachment
-}
attachmentIcon : Icon
attachmentIcon =
    Icon "attachment"


{-| Predefined icon for attachment-small
-}
attachmentSmallIcon : Icon
attachmentSmallIcon =
    Icon "attachment-small"


{-| Predefined icon for autocomplete-date
-}
autocompleteDateIcon : Icon
autocompleteDateIcon =
    Icon "autocomplete-date"


{-| Predefined icon for back-page
-}
backPageIcon : Icon
backPageIcon =
    Icon "back-page"


{-| Predefined icon for blogroll
-}
blogrollIcon : Icon
blogrollIcon =
    Icon "blogroll"


{-| Predefined icon for bp-decisions
-}
bpDecisionsIcon : Icon
bpDecisionsIcon =
    Icon "bp-decisions"


{-| Predefined icon for bp-default
-}
bpDefaultIcon : Icon
bpDefaultIcon =
    Icon "bp-default"


{-| Predefined icon for bp-files
-}
bpFilesIcon : Icon
bpFilesIcon =
    Icon "bp-files"


{-| Predefined icon for bp-requirements
-}
bpRequirementsIcon : Icon
bpRequirementsIcon =
    Icon "bp-requirements"


{-| Predefined icon for bp-howto
-}
bpHowtoIcon : Icon
bpHowtoIcon =
    Icon "bp-howto"


{-| Predefined icon for bp-jira
-}
bpJiraIcon : Icon
bpJiraIcon =
    Icon "bp-jira"


{-| Predefined icon for bp-meeting
-}
bpMeetingIcon : Icon
bpMeetingIcon =
    Icon "bp-meeting"


{-| Predefined icon for bp-retrospective
-}
bpRetrospectiveIcon : Icon
bpRetrospectiveIcon =
    Icon "bp-retrospective"


{-| Predefined icon for bp-sharedlinks
-}
bpSharedlinksIcon : Icon
bpSharedlinksIcon =
    Icon "bp-sharedlinks"


{-| Predefined icon for bp-troubleshooting
-}
bpTroubleshootingIcon : Icon
bpTroubleshootingIcon =
    Icon "bp-troubleshooting"


{-| Predefined icon for build
-}
buildIcon : Icon
buildIcon =
    Icon "build"


{-| Predefined icon for calendar
-}
calendarIcon : Icon
calendarIcon =
    Icon "calendar"


{-| Predefined icon for close-dialog
-}
closeDialogIcon : Icon
closeDialogIcon =
    Icon "close-dialog"


{-| Predefined icon for collapsed
-}
collapsedIcon : Icon
collapsedIcon =
    Icon "collapsed"


{-| Predefined icon for comment
-}
commentIcon : Icon
commentIcon =
    Icon "comment"


{-| Predefined icon for configure
-}
configureIcon : Icon
configureIcon =
    Icon "configure"


{-| Predefined icon for confluence
-}
confluenceIcon : Icon
confluenceIcon =
    Icon "confluence"


{-| Predefined icon for copy-clipboard
-}
copyClipboardIcon : Icon
copyClipboardIcon =
    Icon "copy-clipboard"


{-| Predefined icon for custom-bullet
-}
customBulletIcon : Icon
customBulletIcon =
    Icon "custom-bullet"


{-| Predefined icon for delete
-}
deleteIcon : Icon
deleteIcon =
    Icon "delete"


{-| Predefined icon for deploy
-}
deployIcon : Icon
deployIcon =
    Icon "deploy"


{-| Predefined icon for details
-}
detailsIcon : Icon
detailsIcon =
    Icon "details"


{-| Predefined icon for doc
-}
docIcon : Icon
docIcon =
    Icon "doc"


{-| Predefined icon for down
-}
downIcon : Icon
downIcon =
    Icon "down"


{-| Predefined icon for drag-vertical
-}
dragVerticalIcon : Icon
dragVerticalIcon =
    Icon "drag-vertical"


{-| Predefined icon for edit
-}
editIcon : Icon
editIcon =
    Icon "edit"


{-| Predefined icon for edit-small
-}
editSmallIcon : Icon
editSmallIcon =
    Icon "edit-small"


{-| Predefined icon for email
-}
emailIcon : Icon
emailIcon =
    Icon "email"


{-| Predefined icon for error
-}
errorIcon : Icon
errorIcon =
    Icon "error"


{-| Predefined icon for expanded
-}
expandedIcon : Icon
expandedIcon =
    Icon "expanded"


{-| Predefined icon for file-code
-}
fileCodeIcon : Icon
fileCodeIcon =
    Icon "file-code"


{-| Predefined icon for file-doc
-}
fileDocIcon : Icon
fileDocIcon =
    Icon "file-doc"


{-| Predefined icon for file-java
-}
fileJavaIcon : Icon
fileJavaIcon =
    Icon "file-java"


{-| Predefined icon for file-pdf
-}
filePdfIcon : Icon
filePdfIcon =
    Icon "file-pdf"


{-| Predefined icon for file-ppt
-}
filePptIcon : Icon
filePptIcon =
    Icon "file-ppt"


{-| Predefined icon for file-txt
-}
fileTxtIcon : Icon
fileTxtIcon =
    Icon "file-txt"


{-| Predefined icon for file-wav
-}
fileWavIcon : Icon
fileWavIcon =
    Icon "file-wav"


{-| Predefined icon for file-xls
-}
fileXlsIcon : Icon
fileXlsIcon =
    Icon "file-xls"


{-| Predefined icon for file-zip
-}
fileZipIcon : Icon
fileZipIcon =
    Icon "file-zip"


{-| Predefined icon for flag
-}
flagIcon : Icon
flagIcon =
    Icon "flag"


{-| Predefined icon for focus
-}
focusIcon : Icon
focusIcon =
    Icon "focus"


{-| Predefined icon for group
-}
groupIcon : Icon
groupIcon =
    Icon "group"


{-| Predefined icon for handle-horizontal
-}
handleHorizontalIcon : Icon
handleHorizontalIcon =
    Icon "handle-horizontal"


{-| Predefined icon for help
-}
helpIcon : Icon
helpIcon =
    Icon "help"


{-| Predefined icon for hipchat
-}
hipchatIcon : Icon
hipchatIcon =
    Icon "hipchat"


{-| Predefined icon for homepage
-}
homepageIcon : Icon
homepageIcon =
    Icon "homepage"


{-| Predefined icon for image
-}
imageIcon : Icon
imageIcon =
    Icon "image"


{-| Predefined icon for image-extrasmall
-}
imageExtrasmallIcon : Icon
imageExtrasmallIcon =
    Icon "image-extrasmall"


{-| Predefined icon for image-small
-}
imageSmallIcon : Icon
imageSmallIcon =
    Icon "image-small"


{-| Predefined icon for info
-}
infoIcon : Icon
infoIcon =
    Icon "info"


{-| Predefined icon for like
-}
likeIcon : Icon
likeIcon =
    Icon "like"


{-| Predefined icon for like-small
-}
likeSmallIcon : Icon
likeSmallIcon =
    Icon "like-small"


{-| Predefined icon for weblink
-}
weblinkIcon : Icon
weblinkIcon =
    Icon "weblink"


{-| Predefined icon for link
-}
linkIcon : Icon
linkIcon =
    Icon "link"


{-| Predefined icon for list-add
-}
listAddIcon : Icon
listAddIcon =
    Icon "list-add"


{-| Predefined icon for list-remove
-}
listRemoveIcon : Icon
listRemoveIcon =
    Icon "list-remove"


{-| Predefined icon for locked
-}
lockedIcon : Icon
lockedIcon =
    Icon "locked"


{-| Predefined icon for locked-small
-}
lockedSmallIcon : Icon
lockedSmallIcon =
    Icon "locked-small"


{-| Predefined icon for macro-code
-}
macroCodeIcon : Icon
macroCodeIcon =
    Icon "macro-code"


{-| Predefined icon for macro-default
-}
macroDefaultIcon : Icon
macroDefaultIcon =
    Icon "macro-default"


{-| Predefined icon for macro-gallery
-}
macroGalleryIcon : Icon
macroGalleryIcon =
    Icon "macro-gallery"


{-| Predefined icon for macro-status
-}
macroStatusIcon : Icon
macroStatusIcon =
    Icon "macro-status"


{-| Predefined icon for more
-}
moreIcon : Icon
moreIcon =
    Icon "more"


{-| Predefined icon for nav-children
-}
navChildrenIcon : Icon
navChildrenIcon =
    Icon "nav-children"


{-| Predefined icon for page-blank
-}
pageBlankIcon : Icon
pageBlankIcon =
    Icon "page-blank"


{-| Predefined icon for page-blogpost
-}
pageBlogpostIcon : Icon
pageBlogpostIcon =
    Icon "page-blogpost"


{-| Predefined icon for page-default
-}
pageDefaultIcon : Icon
pageDefaultIcon =
    Icon "page-default"


{-| Predefined icon for page-template
-}
pageTemplateIcon : Icon
pageTemplateIcon =
    Icon "page-template"


{-| Predefined icon for pages
-}
pagesIcon : Icon
pagesIcon =
    Icon "pages"


{-| Predefined icon for quote
-}
quoteIcon : Icon
quoteIcon =
    Icon "quote"


{-| Predefined icon for redo
-}
redoIcon : Icon
redoIcon =
    Icon "redo"


{-| Predefined icon for remove
-}
removeIcon : Icon
removeIcon =
    Icon "remove"


{-| Predefined icon for remove-label
-}
removeLabelIcon : Icon
removeLabelIcon =
    Icon "remove-label"


{-| Predefined icon for review
-}
reviewIcon : Icon
reviewIcon =
    Icon "review"


{-| Predefined icon for rss
-}
rssIcon : Icon
rssIcon =
    Icon "rss"


{-| Predefined icon for search
-}
searchIcon : Icon
searchIcon =
    Icon "search"


{-| Predefined icon for search-small
-}
searchSmallIcon : Icon
searchSmallIcon =
    Icon "search-small"


{-| Predefined icon for share
-}
shareIcon : Icon
shareIcon =
    Icon "share"


{-| Predefined icon for sidebar-link
-}
sidebarLinkIcon : Icon
sidebarLinkIcon =
    Icon "sidebar-link"


{-| Predefined icon for sourcetree
-}
sourcetreeIcon : Icon
sourcetreeIcon =
    Icon "sourcetree"


{-| Predefined icon for space-default
-}
spaceDefaultIcon : Icon
spaceDefaultIcon =
    Icon "space-default"


{-| Predefined icon for space-personal
-}
spacePersonalIcon : Icon
spacePersonalIcon =
    Icon "space-personal"


{-| Predefined icon for star
-}
starIcon : Icon
starIcon =
    Icon "star"


{-| Predefined icon for success
-}
successIcon : Icon
successIcon =
    Icon "success"


{-| Predefined icon for table-bg
-}
tableBgIcon : Icon
tableBgIcon =
    Icon "table-bg"


{-| Predefined icon for table-col-left
-}
tableColLeftIcon : Icon
tableColLeftIcon =
    Icon "table-col-left"


{-| Predefined icon for table-col-remove
-}
tableColRemoveIcon : Icon
tableColRemoveIcon =
    Icon "table-col-remove"


{-| Predefined icon for table-col-right
-}
tableColRightIcon : Icon
tableColRightIcon =
    Icon "table-col-right"


{-| Predefined icon for table-copy-row
-}
tableCopyRowIcon : Icon
tableCopyRowIcon =
    Icon "table-copy-row"


{-| Predefined icon for table-cut-row
-}
tableCutRowIcon : Icon
tableCutRowIcon =
    Icon "table-cut-row"


{-| Predefined icon for table-header-column
-}
tableHeaderColumnIcon : Icon
tableHeaderColumnIcon =
    Icon "table-header-column"


{-| Predefined icon for table-header-row
-}
tableHeaderRowIcon : Icon
tableHeaderRowIcon =
    Icon "table-header-row"


{-| Predefined icon for table-merge
-}
tableMergeIcon : Icon
tableMergeIcon =
    Icon "table-merge"


{-| Predefined icon for table-no-bg
-}
tableNoBgIcon : Icon
tableNoBgIcon =
    Icon "table-no-bg"


{-| Predefined icon for table-paste-row
-}
tablePasteRowIcon : Icon
tablePasteRowIcon =
    Icon "table-paste-row"


{-| Predefined icon for table-remove
-}
tableRemoveIcon : Icon
tableRemoveIcon =
    Icon "table-remove"


{-| Predefined icon for table-row-down
-}
tableRowDownIcon : Icon
tableRowDownIcon =
    Icon "table-row-down"


{-| Predefined icon for table-row-remove
-}
tableRowRemoveIcon : Icon
tableRowRemoveIcon =
    Icon "table-row-remove"


{-| Predefined icon for table-row-up
-}
tableRowUpIcon : Icon
tableRowUpIcon =
    Icon "table-row-up"


{-| Predefined icon for table-split
-}
tableSplitIcon : Icon
tableSplitIcon =
    Icon "table-split"


{-| Predefined icon for teamcals
-}
teamcalsIcon : Icon
teamcalsIcon =
    Icon "teamcals"


{-| Predefined icon for time
-}
timeIcon : Icon
timeIcon =
    Icon "time"


{-| Predefined icon for undo
-}
undoIcon : Icon
undoIcon =
    Icon "undo"


{-| Predefined icon for unfocus
-}
unfocusIcon : Icon
unfocusIcon =
    Icon "unfocus"


{-| Predefined icon for unlocked
-}
unlockedIcon : Icon
unlockedIcon =
    Icon "unlocked"


{-| Predefined icon for unstar
-}
unstarIcon : Icon
unstarIcon =
    Icon "unstar"


{-| Predefined icon for unwatch
-}
unwatchIcon : Icon
unwatchIcon =
    Icon "unwatch"


{-| Predefined icon for up
-}
upIcon : Icon
upIcon =
    Icon "up"


{-| Predefined icon for user
-}
userIcon : Icon
userIcon =
    Icon "user"


{-| Predefined icon for user-status
-}
userStatusIcon : Icon
userStatusIcon =
    Icon "user-status"


{-| Predefined icon for view
-}
viewIcon : Icon
viewIcon =
    Icon "view"


{-| Predefined icon for view-card
-}
viewCardIcon : Icon
viewCardIcon =
    Icon "view-card"


{-| Predefined icon for view-list
-}
viewListIcon : Icon
viewListIcon =
    Icon "view-list"


{-| Predefined icon for view-table
-}
viewTableIcon : Icon
viewTableIcon =
    Icon "view-table"


{-| Predefined icon for warning
-}
warningIcon : Icon
warningIcon =
    Icon "warning"


{-| Predefined icon for watch
-}
watchIcon : Icon
watchIcon =
    Icon "watch"


{-| Predefined icon for workbox
-}
workboxIcon : Icon
workboxIcon =
    Icon "workbox"


{-| Predefined icon for workbox-empty
-}
workboxEmptyIcon : Icon
workboxEmptyIcon =
    Icon "workbox-empty"


{-| Predefined icon for configure-columns
-}
configureColumnsIcon : Icon
configureColumnsIcon =
    Icon "configure-columns"


{-| Predefined icon for export
-}
exportIcon : Icon
exportIcon =
    Icon "export"


{-| Predefined icon for export-list
-}
exportListIcon : Icon
exportListIcon =
    Icon "export-list"


{-| Predefined icon for file-image
-}
fileImageIcon : Icon
fileImageIcon =
    Icon "file-image"


{-| Predefined icon for admin-fusion
-}
adminFusionIcon : Icon
adminFusionIcon =
    Icon "admin-fusion"


{-| Predefined icon for admin-jira-fields
-}
adminJiraFieldsIcon : Icon
adminJiraFieldsIcon =
    Icon "admin-jira-fields"


{-| Predefined icon for admin-issue
-}
adminIssueIcon : Icon
adminIssueIcon =
    Icon "admin-issue"


{-| Predefined icon for admin-notifications
-}
adminNotificationsIcon : Icon
adminNotificationsIcon =
    Icon "admin-notifications"


{-| Predefined icon for admin-roles
-}
adminRolesIcon : Icon
adminRolesIcon =
    Icon "admin-roles"


{-| Predefined icon for admin-jira-screens
-}
adminJiraScreensIcon : Icon
adminJiraScreensIcon =
    Icon "admin-jira-screens"


{-| Predefined icon for pause
-}
pauseIcon : Icon
pauseIcon =
    Icon "pause"


{-| Predefined icon for priority-highest
-}
priorityHighestIcon : Icon
priorityHighestIcon =
    Icon "priority-highest"


{-| Predefined icon for priority-high
-}
priorityHighIcon : Icon
priorityHighIcon =
    Icon "priority-high"


{-| Predefined icon for priority-medium
-}
priorityMediumIcon : Icon
priorityMediumIcon =
    Icon "priority-medium"


{-| Predefined icon for priority-low
-}
priorityLowIcon : Icon
priorityLowIcon =
    Icon "priority-low"


{-| Predefined icon for priority-lowest
-}
priorityLowestIcon : Icon
priorityLowestIcon =
    Icon "priority-lowest"


{-| Predefined icon for refresh-small
-}
refreshSmallIcon : Icon
refreshSmallIcon =
    Icon "refresh-small"


{-| Predefined icon for share-list
-}
shareListIcon : Icon
shareListIcon =
    Icon "share-list"


{-| Predefined icon for switch-small
-}
switchSmallIcon : Icon
switchSmallIcon =
    Icon "switch-small"


{-| Predefined icon for version
-}
versionIcon : Icon
versionIcon =
    Icon "version"


{-| Predefined icon for workflow
-}
workflowIcon : Icon
workflowIcon =
    Icon "workflow"


{-| Predefined icon for admin-jira-settings
-}
adminJiraSettingsIcon : Icon
adminJiraSettingsIcon =
    Icon "admin-jira-settings"


{-| Predefined icon for component
-}
componentIcon : Icon
componentIcon =
    Icon "component"


{-| Predefined icon for reopen
-}
reopenIcon : Icon
reopenIcon =
    Icon "reopen"


{-| Predefined icon for roadmap
-}
roadmapIcon : Icon
roadmapIcon =
    Icon "roadmap"


{-| Predefined icon for deploy-success
-}
deploySuccessIcon : Icon
deploySuccessIcon =
    Icon "deploy-success"


{-| Predefined icon for deploy-fail
-}
deployFailIcon : Icon
deployFailIcon =
    Icon "deploy-fail"


{-| Predefined icon for file-generic
-}
fileGenericIcon : Icon
fileGenericIcon =
    Icon "file-generic"


{-| Predefined icon for arrow-down
-}
arrowDownIcon : Icon
arrowDownIcon =
    Icon "arrow-down"


{-| Predefined icon for arrow-up
-}
arrowUpIcon : Icon
arrowUpIcon =
    Icon "arrow-up"


{-| Predefined icon for file-video
-}
fileVideoIcon : Icon
fileVideoIcon =
    Icon "file-video"


{-| Predefined icon for blogroll-large
-}
blogrollLargeIcon : Icon
blogrollLargeIcon =
    Icon "blogroll-large"


{-| Predefined icon for email-large
-}
emailLargeIcon : Icon
emailLargeIcon =
    Icon "email-large"


{-| Predefined icon for layout-1col-large
-}
layout1ColLargeIcon : Icon
layout1ColLargeIcon =
    Icon "layout-1col-large"


{-| Predefined icon for layout-2col-large
-}
layout2ColLargeIcon : Icon
layout2ColLargeIcon =
    Icon "layout-2col-large"


{-| Predefined icon for layout-2col-left-large
-}
layout2ColLeftLargeIcon : Icon
layout2ColLeftLargeIcon =
    Icon "layout-2col-left-large"


{-| Predefined icon for layout-2col-right-large
-}
layout2ColRightLargeIcon : Icon
layout2ColRightLargeIcon =
    Icon "layout-2col-right-large"


{-| Predefined icon for layout-3col-center-large
-}
layout3ColCenterLargeIcon : Icon
layout3ColCenterLargeIcon =
    Icon "layout-3col-center-large"


{-| Predefined icon for layout-3col-large
-}
layout3ColLargeIcon : Icon
layout3ColLargeIcon =
    Icon "layout-3col-large"


{-| Predefined icon for nav-children-large
-}
navChildrenLargeIcon : Icon
navChildrenLargeIcon =
    Icon "nav-children-large"


{-| Predefined icon for pages-large
-}
pagesLargeIcon : Icon
pagesLargeIcon =
    Icon "pages-large"


{-| Predefined icon for sidebar-link-large
-}
sidebarLinkLargeIcon : Icon
sidebarLinkLargeIcon =
    Icon "sidebar-link-large"


{-| Predefined icon for teamcals-large
-}
teamcalsLargeIcon : Icon
teamcalsLargeIcon =
    Icon "teamcals-large"


{-| Predefined icon for user-large
-}
userLargeIcon : Icon
userLargeIcon =
    Icon "user-large"


{-| Predefined icon for jira-issues
-}
jiraIssuesIcon : Icon
jiraIssuesIcon =
    Icon "jira-issues"


{-| Predefined icon for devtools-arrow-left
-}
devtoolsArrowLeftIcon : Icon
devtoolsArrowLeftIcon =
    Icon "devtools-arrow-left"


{-| Predefined icon for devtools-arrow-right
-}
devtoolsArrowRightIcon : Icon
devtoolsArrowRightIcon =
    Icon "devtools-arrow-right"


{-| Predefined icon for devtools-branch
-}
devtoolsBranchIcon : Icon
devtoolsBranchIcon =
    Icon "devtools-branch"


{-| Predefined icon for devtools-branch-small
-}
devtoolsBranchSmallIcon : Icon
devtoolsBranchSmallIcon =
    Icon "devtools-branch-small"


{-| Predefined icon for devtools-browse-up
-}
devtoolsBrowseUpIcon : Icon
devtoolsBrowseUpIcon =
    Icon "devtools-browse-up"


{-| Predefined icon for devtools-checkout
-}
devtoolsCheckoutIcon : Icon
devtoolsCheckoutIcon =
    Icon "devtools-checkout"


{-| Predefined icon for devtools-clone
-}
devtoolsCloneIcon : Icon
devtoolsCloneIcon =
    Icon "devtools-clone"


{-| Predefined icon for devtools-commit
-}
devtoolsCommitIcon : Icon
devtoolsCommitIcon =
    Icon "devtools-commit"


{-| Predefined icon for devtools-compare
-}
devtoolsCompareIcon : Icon
devtoolsCompareIcon =
    Icon "devtools-compare"


{-| Predefined icon for devtools-file
-}
devtoolsFileIcon : Icon
devtoolsFileIcon =
    Icon "devtools-file"


{-| Predefined icon for devtools-file-binary
-}
devtoolsFileBinaryIcon : Icon
devtoolsFileBinaryIcon =
    Icon "devtools-file-binary"


{-| Predefined icon for devtools-file-commented
-}
devtoolsFileCommentedIcon : Icon
devtoolsFileCommentedIcon =
    Icon "devtools-file-commented"


{-| Predefined icon for devtools-folder-closed
-}
devtoolsFolderClosedIcon : Icon
devtoolsFolderClosedIcon =
    Icon "devtools-folder-closed"


{-| Predefined icon for devtools-folder-open
-}
devtoolsFolderOpenIcon : Icon
devtoolsFolderOpenIcon =
    Icon "devtools-folder-open"


{-| Predefined icon for devtools-fork
-}
devtoolsForkIcon : Icon
devtoolsForkIcon =
    Icon "devtools-fork"


{-| Predefined icon for devtools-pull-request
-}
devtoolsPullRequestIcon : Icon
devtoolsPullRequestIcon =
    Icon "devtools-pull-request"


{-| Predefined icon for devtools-repository
-}
devtoolsRepositoryIcon : Icon
devtoolsRepositoryIcon =
    Icon "devtools-repository"


{-| Predefined icon for devtools-repository-forked
-}
devtoolsRepositoryForkedIcon : Icon
devtoolsRepositoryForkedIcon =
    Icon "devtools-repository-forked"


{-| Predefined icon for devtools-repository-locked
-}
devtoolsRepositoryLockedIcon : Icon
devtoolsRepositoryLockedIcon =
    Icon "devtools-repository-locked"


{-| Predefined icon for devtools-side-diff
-}
devtoolsSideDiffIcon : Icon
devtoolsSideDiffIcon =
    Icon "devtools-side-diff"


{-| Predefined icon for devtools-submodule
-}
devtoolsSubmoduleIcon : Icon
devtoolsSubmoduleIcon =
    Icon "devtools-submodule"


{-| Predefined icon for devtools-tag
-}
devtoolsTagIcon : Icon
devtoolsTagIcon =
    Icon "devtools-tag"


{-| Predefined icon for devtools-tag-small
-}
devtoolsTagSmallIcon : Icon
devtoolsTagSmallIcon =
    Icon "devtools-tag-small"


{-| Predefined icon for devtools-task-cancelled
-}
devtoolsTaskCancelledIcon : Icon
devtoolsTaskCancelledIcon =
    Icon "devtools-task-cancelled"


{-| Predefined icon for devtools-task-disabled
-}
devtoolsTaskDisabledIcon : Icon
devtoolsTaskDisabledIcon =
    Icon "devtools-task-disabled"


{-| Predefined icon for devtools-task-in-progress
-}
devtoolsTaskInProgressIcon : Icon
devtoolsTaskInProgressIcon =
    Icon "devtools-task-in-progress"


{-| Predefined icon for bitbucket
-}
bitbucketIcon : Icon
bitbucketIcon =
    Icon "bitbucket"


{-| Predefined icon for editor-align-center
-}
editorAlignCenterIcon : Icon
editorAlignCenterIcon =
    Icon "editor-align-center"


{-| Predefined icon for editor-align-left
-}
editorAlignLeftIcon : Icon
editorAlignLeftIcon =
    Icon "editor-align-left"


{-| Predefined icon for editor-align-right
-}
editorAlignRightIcon : Icon
editorAlignRightIcon =
    Icon "editor-align-right"


{-| Predefined icon for editor-bold
-}
editorBoldIcon : Icon
editorBoldIcon =
    Icon "editor-bold"


{-| Predefined icon for editor-color
-}
editorColorIcon : Icon
editorColorIcon =
    Icon "editor-color"


{-| Predefined icon for editor-emoticon
-}
editorEmoticonIcon : Icon
editorEmoticonIcon =
    Icon "editor-emoticon"


{-| Predefined icon for editor-help
-}
editorHelpIcon : Icon
editorHelpIcon =
    Icon "editor-help"


{-| Predefined icon for editor-hr
-}
editorHrIcon : Icon
editorHrIcon =
    Icon "editor-hr"


{-| Predefined icon for editor-indent
-}
editorIndentIcon : Icon
editorIndentIcon =
    Icon "editor-indent"


{-| Predefined icon for editor-italic
-}
editorItalicIcon : Icon
editorItalicIcon =
    Icon "editor-italic"


{-| Predefined icon for editor-layout
-}
editorLayoutIcon : Icon
editorLayoutIcon =
    Icon "editor-layout"


{-| Predefined icon for editor-list-bullet
-}
editorListBulletIcon : Icon
editorListBulletIcon =
    Icon "editor-list-bullet"


{-| Predefined icon for editor-list-number
-}
editorListNumberIcon : Icon
editorListNumberIcon =
    Icon "editor-list-number"


{-| Predefined icon for editor-macro-toc
-}
editorMacroTocIcon : Icon
editorMacroTocIcon =
    Icon "editor-macro-toc"


{-| Predefined icon for editor-mention
-}
editorMentionIcon : Icon
editorMentionIcon =
    Icon "editor-mention"


{-| Predefined icon for editor-outdent
-}
editorOutdentIcon : Icon
editorOutdentIcon =
    Icon "editor-outdent"


{-| Predefined icon for editor-styles
-}
editorStylesIcon : Icon
editorStylesIcon =
    Icon "editor-styles"


{-| Predefined icon for editor-symbol
-}
editorSymbolIcon : Icon
editorSymbolIcon =
    Icon "editor-symbol"


{-| Predefined icon for editor-table
-}
editorTableIcon : Icon
editorTableIcon =
    Icon "editor-table"


{-| Predefined icon for editor-task
-}
editorTaskIcon : Icon
editorTaskIcon =
    Icon "editor-task"


{-| Predefined icon for editor-underline
-}
editorUnderlineIcon : Icon
editorUnderlineIcon =
    Icon "editor-underline"


{-| Predefined icon for jira
-}
jiraIcon : Icon
jiraIcon =
    Icon "jira"


{-| Predefined icon for jira-completed-task
-}
jiraCompletedTaskIcon : Icon
jiraCompletedTaskIcon =
    Icon "jira-completed-task"


{-| Predefined icon for jira-test-session
-}
jiraTestSessionIcon : Icon
jiraTestSessionIcon =
    Icon "jira-test-session"
