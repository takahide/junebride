$ ->

  $(".open-popup").click ->
    $(".pmenu").css("display", "none");
    id = $(@).attr("id");
    $(".menu" + id).css("display", "block");


  $(".invite").on "input", ->
    if $(@).val().length == 6
      $.ajax {
        url: "/get/#{$(@).val()}"
        cache: false
        success: (json) ->
          if json is null
            alert "コードが間違っています。"
          else
            $(".guest").text("名前")
            $(".guest-name").val("#{json.name} 様")
      }
    else
      $(".guest").text("")
      $(".guest-name").val("")


  $(".submit").on "click", ->
    code = $(".invite").val()
    if $(".guest-name").val() == ""
      alert "正しいコードが入力されていません。"
      return
    if $(".attend").prop("checked")
      url = "/attend/#{code}"
    else
      url = "/not_attend/#{code}"
    myApp.showPreloader '通信中...'
    $.ajax {
      url: url
      cache: false
      success: (json) ->
        myApp.hidePreloader()
        if json is null
          alert "コードが間違っています。"
        else
          if json.attendance == 1
            str = "出席"
          else if json.attendance == 2
            str = "欠席"
          alert "#{json.name}様「#{str}」で登録しました。"
        location.reload()
    }


