# elm-aui-css

An UI component library for the Elm supporting integration with the CSS of the [Atlassian AUI Framework](https://docs.atlassian.com/aui).

## Install

```
elm package install stil4m/elm-aui-css
```

## Notes

Currently there is one component that uses ports (Single Select) to focus and blur input,
thus to set up the usage of this component properly you need to add the following Javascript to the Elm bootstrap:

```
var app = Elm.YourApp.fullscreen();
app.ports.auiBlur.subscribe(function(selector) {
    document.querySelector(selector).blur();
});
app.ports.auiFocus.subscribe(function(selector) {
    document.querySelector(selector).focus();
});
```

## Supported Components

* Avatars
* Badges
* Buttons
* Dropdown
* Expander
* Icons
* Labels
* Lozenge
* Messages
* Page
* Progress Indicator
* Progress Tracker
* Single Select
* Tabs
* Toggle
* Toolbar

If you request another component, please create in issue for it or a pull request (that would be great).

## Using Components

See the demo source code for each component how to use it.
