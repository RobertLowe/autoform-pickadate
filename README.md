robertlowe:autoform-pickadate
=========================

An add-on Meteor package for [aldeed:autoform](https://github.com/aldeed/meteor-autoform). Provides a single custom input type, "pickadate", which renders an input using the [pickadate](amsul.ca/pickadate.js/date) plugin.

## Prerequisites

None

In a Meteor app directory, enter:

```
$ meteor add robertlowe:autoform-pickadate
```

## Installation

In a Meteor app directory, enter:

```
$ meteor add robertlowe:autoform-pickadate
```

## Usage

Specify "pickadate" for the `type` attribute of any input. This can be done in a number of ways:

In the schema, which will then work with a `quickForm` or `afQuickFields`:

```js
{
  date: {
    type: Date,
    autoform: {
      type: "pickadate"
    }
  }
}
```

Or on the `afFieldInput` component or any component that passes along attributes to `afFieldInput`:

```js
{{> afQuickField name="typeTest" type="pickadate"}}

{{> afFormGroup name="typeTest" type="pickadate"}}

{{> afFieldInput name="typeTest" type="pickadate"}}
```

## Automatic Type Conversions

This input type is intended to be used with `type: Date` schema keys, but it also works with other schema types. Here's a list:

* `Date`: Value is stored as a `Date` object representing midnight in the UTC timezone on the morning of the selected date.
* `String`: Value is stored as a string representation of the selected date in ISO format, e.g., "2014-11-25".
* `Number`: Value is stored as the result of calling `getTime()` on the `Date` object (representing midnight in the UTC timezone on the morning of the selected date).
* `Array`: If the schema expects an array of `Date` or `String` or `Number`, the value is converted to a one-item array and stored.

To provide pickadate options, set a `pickadateOptions` attribute equal to a helper that returns the options object. Most of the `data-date` attributes that the plugin recognizes should also work.

## Customizing Appearance

If you want to customize the appearance of the input more, for example to use input group add-ons both before and after the field, use the [aldeed:template-extension](https://atmospherejs.com/aldeed/template-extension) package to replace the "afPickadate" template, like this:

```html
<template name="dpReplacement">
  <div class='input-group date'>
    <input type="text" value="" {{atts}}/>
    <span class="input-group-addon">
      <span class="glyphicon glyphicon-calendar"></span>
    </span>
  </div>
</template>
```

```js
Template.dpReplacement.replaces("afPickadate");
```

## Contributing

Anyone is welcome to contribute. Fork, make your changes, and then submit a pull request.
