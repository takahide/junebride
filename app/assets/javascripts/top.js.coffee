$ ->

  $(".black").addClass("fade")

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
            if json.attendance == 11
              $(".attend1").prop("checked", true)
              $(".attend2").prop("checked", true)
            if json.attendance == 22
              $(".attend1").prop("checked", false)
              $(".attend2").prop("checked", false)
            if json.attendance == 12
              $(".attend1").prop("checked", true)
              $(".attend2").prop("checked", false)
            if json.attendance == 21
              $(".attend1").prop("checked", false)
              $(".attend2").prop("checked", true)
      }
    else
      $(".guest").text("")
      $(".guest-name").val("")


  $(".submit").on "click", ->
    code = $(".invite").val()
    if $(".guest-name").val() == ""
      alert "正しいコードが入力されていません。"
      return
    if $(".attend1").prop("checked") && $(".attend2").prop("checked")
      url = "/attend/#{code}"
    else if $(".attend1").prop("checked")
      url = "/only_1_attend/#{code}"
    else if $(".attend2").prop("checked")
      url = "/only_2_attend/#{code}"
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
          if json.attendance == 11
            str1 = "出席"
            str2 = "出席"
          else if json.attendance == 22
            str1 = "欠席"
            str2 = "欠席"
          else if json.attendance == 12
            str1 = "出席"
            str2 = "欠席"
          else if json.attendance == 21
            str1 = "欠席"
            str2 = "出席"
          alert "#{json.name}様\n挙式「#{str1}」\n披露宴「#{str2}」\nで登録しました"
        location.reload()
    }


