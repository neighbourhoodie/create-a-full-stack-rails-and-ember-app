`import Ember from 'ember'`

IsEqualHelper = Ember.Helper.helper ([left, right]) ->
  Ember.isEqual(left, right) ||
    (left && right && Ember.isEqual(left.get('id'), right.get('id')))

`export default IsEqualHelper`
