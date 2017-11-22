// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

$(document).ready(function(){
    $('.remove').on('click', function(event){
        event.preventDefault()
        console.log("enter");
        if(confirm("Sure mou?")){
            var token = document.querySelector('meta[name="csrf-token"]')["content"]
            $.ajax({
                url: event.currentTarget.href,
                method: 'DELETE',
                data: { authenticity_token: token },
                dataType: 'json',
                success: function(r){
                    $('#project-' + r.id).remove()
                }
            });
        }
    });
});