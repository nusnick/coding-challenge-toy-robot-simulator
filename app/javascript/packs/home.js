import $ from 'jquery'

var Home = {

  robot: {x: null, y: null, f: null, isValid: false},

  init: function(){
    $('#place-form').on('submit', this.placeCommandHandler)
    $('.controls .left').on('click', this.leftCommandHandler)
    $('.controls .right').on('click', this.rightCommandHandler)
    $('.controls .move').on('click', this.moveCommandHandler)
    $('.controls .report').on('click', this.reportCommandHandler)
  },

  placeCommandHandler: function(e){
    e.preventDefault();
    var data = new FormData(e.target);
    var x = data.get('x');
    var y = data.get('y');
    var f = data.get('f');
    var command = `PLACE ${x},${y},${f}`
    Home.printConsole(command);
    Home.requestCommand(command)
  },

  leftCommandHandler: function(e){
    Home.printConsole('LEFT');
    Home.robot.isValid && Home.requestCommand('LEFT');
  },

  rightCommandHandler: function(e){
    Home.printConsole('RIGHT');
    Home.robot.isValid && Home.requestCommand('RIGHT');
  },

  moveCommandHandler: function(e){
    Home.printConsole('MOVE');
    Home.robot.isValid && Home.requestCommand('MOVE');
  },

  reportCommandHandler: function(e){
    Home.printConsole('REPORT');
    var robot = Home.robot;
    Home.robot.isValid && Home.printConsole(`${robot.x},${robot.y},${robot.f}`);
  },

  requestCommand: function(command){
    var data = {
      authenticity_token: $('[name="csrf-token"]')[0].content,
      robot: this.robot,
      commands: [command]
    }
    $.ajax({
      url: '/commands/run',
      type: 'PUT',
      dataType: 'json',
      data: data,
      success: this.sucessCommandCallback
    });
  },

  sucessCommandCallback: function(res){
    Home.robot = res;
    $('#place-modal .close').click();
    Home.drawRobot();
  },

  drawRobot: function(){
    if (!this.robot.isValid) return;

    var $robot = $('#robot');
    $robot.removeClass();
    $robot.addClass(this.robot.f);
    $robot.css('bottom', this.robot.y * 100 + 'px')
    $robot.css('left', this.robot.x * 100 + 'px')
  },

  printConsole: function(content){
    $('.console').append(`${content} <br/>`);
  }

}

//////////////////////////////
$(document).ready(function(){
  Home.init()
})