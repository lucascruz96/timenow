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

function formatarData(data)
{
  var dataVetor = data.split(" ");
  var data1 = dataVetor[0].split("-");
  var dia=data1[2];
  var mes=data1[1];
  var ano=data1[0];
  var dataFormatada = dia + '/' + mes + '/' + ano;

  console.log(dataFormatada);

  return dataFormatada;
}

function liberarEdicao(id, title, description, category, spentTime, created, date, done)
{
  console.log(done);
  document.getElementById("task_id").value = id;
  document.getElementById("task_title").value = title;
  document.getElementById("task_description").value = description;
  document.getElementById("txtspentTime").innerHTML = spentTime + " hrs";
  document.getElementById("task_category").value = category;
  document.getElementById("dataCriacao").innerHTML = formatarData(created);
  document.getElementById("dataExecucao").innerHTML = formatarData(date);
  //document.getElementById("switch-1").checked;
  //$("#switch-1").attr("checked", "checked");
}

function recarregar()
{
  location.reload();
}

function agrupar(id, title, spentTime)
{
  if($("#" + id +"_task").hasClass("ativo")){

      $("#selection_" + id).remove();
      $("#" + id +"_task").removeClass('ativo');
      subtrairTotal(spentTime);

  }else{
      document.getElementById("corpoSelecao").innerHTML += gerarLinha(id, title, spentTime);
      $("#" + id +"_task").addClass('ativo');
      somarTotal(spentTime);
  }

}


function gerarLinha(id, title, spentTime)
{
  var linha = "<tr id=\"selection_" + id + "\">";
  linha += "<td>" + title + "</td>";
  linha += "<td>" + spentTime + "</td>";
  linha += "</tr>";

  return linha;
}

function somarTotal(novoTempo){

  novoTempo = parseInt(novoTempo);
  var cont = parseInt(document.getElementById("totalSelection").innerHTML);
  novoTempo = cont + novoTempo; 

  document.getElementById("totalSelection").innerHTML = novoTempo;

}


function subtrairTotal(novoTempo){

  novoTempo = parseInt(novoTempo);
  var cont = parseInt(document.getElementById("totalSelection").innerHTML);
  novoTempo = cont - novoTempo; 

  document.getElementById("totalSelection").innerHTML = novoTempo;

}