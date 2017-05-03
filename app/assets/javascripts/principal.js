$(".item-recente").click(function(){

$("#editar-tarefas").show();

});

$(".cancelar").click(function(){

  window.reload("http://localhost:3000/cadastroTarefas");

});

$(".list-task-dashboard").click(function(){

$("#editar-tarefas").show();

});

$(window, document, undefined).ready(function() {

  $('input').blur(function() {
    var $this = $(this);
    if ($this.val())
      $this.addClass('used');
    else
      $this.removeClass('used');
  });

  var $ripples = $('.ripples');

  $ripples.on('click.Ripples', function(e) {

    var $this = $(this);
    var $offset = $this.parent().offset();
    var $circle = $this.find('.ripplesCircle');

    var x = e.pageX - $offset.left;
    var y = e.pageY - $offset.top;

    $circle.css({
      top: y + 'px',
      left: x + 'px'
    });

    $this.addClass('is-active');

  });

  $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
  	$(this).removeClass('is-active');
  });

});


function liberarEdicao(id, title, description, category, spentTime, created, idDayWeek)
{
  var data = created.split(" ");
  var data1 = data[0].split("-");
  var dia=data1[2];
  var mes=data1[1];
  var ano=data1[0];
  var dataCriacao = dia + '/' + mes + '/' + ano;
  
  document.getElementById("task_id").value = id;
  document.getElementById("task_title").value = title;
  document.getElementById("task_description").value = description;
  document.getElementById("txtSpenTime").innerHTML = spentTime + " hrs";
  document.getElementById("task_category").value = category;
  document.getElementById("dataCricao").innerHTML = dataCriacao;
  document.getElementById("task_day_week").value = idDayWeek;
}

function recarregar()
{
  location.reload();
}