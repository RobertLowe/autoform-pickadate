utcToLocal = (utcDate) ->
  localDateObj = new Date
  localDateObj.setDate utcDate.getUTCDate()
  localDateObj.setMonth utcDate.getUTCMonth()
  localDateObj.setFullYear utcDate.getUTCFullYear()
  localDateObj.setHours 0
  localDateObj.setMinutes 0
  localDateObj.setSeconds 0
  localDateObj.setMilliseconds 0
  localDateObj

AutoForm.addInputType 'pickadate',
  template: 'afPickadate'
  valueOut: ->
    if @val()
      val = @datepicker('getUTCDate')
      return if val instanceof Date then val else @val()
    return
  valueConverters:
    'string': (val) ->
      if val instanceof Date then AutoForm.Utility.dateToDateStringUTC(val) else val
    'stringArray': (val) ->
      if val instanceof Date
        return [ AutoForm.Utility.dateToDateStringUTC(val) ]
      val
    'number': (val) ->
      if val instanceof Date then val.getTime() else val
    'numberArray': (val) ->
      if val instanceof Date
        return [ val.getTime() ]
      val
    'dateArray': (val) ->
      if val instanceof Date
        return [ val ]
      val

Template.afPickadate.helpers 
  atts: ->
    atts = _.clone(@atts)
    atts = AutoForm.Utility.addClass(atts, 'form-control')
    # cannot have nested atts or Blaze explodes
    delete atts.pickadateOptions
    atts

Template.afPickadate.rendered = ->
  $input = @$('input')
  data = @data

  $input.pickadate data.atts.pickadateOptions
  $picker = $input.pickadate('picker')

  @autorun ->
    data = Template.currentData()
    # set field value
    if data.value instanceof Date
      $picker.set 'select', data.value
    else if typeof data.value == 'string'
      $picker.set 'select', data.value
    # set start date if there's a min in the schema
    if data.min instanceof Date
      # datepicker plugin expects local Date object,
      # so convert UTC Date object to local
      startDate = utcToLocal(data.min)
      $picker.set 'min', startDate
    # set end date if there's a max in the schema
    if data.max instanceof Date
      # datepicker plugin expects local Date object,
      # so convert UTC Date object to local
      endDate = utcToLocal(data.max)
      $picker.set 'max', startDate


Template.afPickadate.destroyed = ->
  $input  = @$('input')
  $picker = $input.pickadate('picker')
  $picker.stop()

