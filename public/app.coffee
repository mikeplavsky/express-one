class Model

 name: ko.observable("Apple Pie")
 firstName: ko.observable("Bert")
 lastName: ko.observable("Bertington")

 fullName: ko.computed( (-> "#{Model::firstName()} #{Model::lastName()}"), this)

 capitalizeLastName: ->
   curr = @lastName()
   @lastName( curr.toUpperCase() )

ko.applyBindings(new Model())


