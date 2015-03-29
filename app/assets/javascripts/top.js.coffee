$ ->
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
            $(".guest-name").val(json.name)
      }
    else
      $(".guest").text("")
      $(".guest-name").val("")


  $(".submit").on "click", ->
    code = $(".invite").val()
    if $(".guest-name").val() == ""
      alert "正しいコードが入力されていません。"
    if $(".attend").prop("checked")
      url = "/attend/#{code}"
    else
      url = "/not_attend/#{code}"
    $.ajax {
      url: url
      cache: false
      success: (json) ->
        if json is null
          alert "コードが間違っています。"
        else
          if json.attendance == 1
            str = "出席"
          else if json.attendance == 2
            str = "欠席"
          alert "#{json.name}様「#{str}」で登録しました。"
    }


