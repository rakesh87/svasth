# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$: ->

  TodoItem = Backbone.Model.extend({});

  toDoItem = new TodoItem(
    {desc: "pick me up!", status: "pending", id: 1}
  )

  ToDoView = Backbone.View.extend({
    render: ->
      html = '<h4>' + this.model.get('desc') + '</h4>'
      $(this.el).html(html)
  })

  todoView = new ToDoView({model: toDoItem})
  todoView.render()
  console.log(todoView.el)
  alert "dfdsgfsd"
