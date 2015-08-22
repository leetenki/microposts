$ ->
	$('select#user_country_code').change (event) ->
		select_wrapper = $('#user_state_code_wrapper')
		$('select', select_wrapper).attr('disabled', true)

		country_code = $(this).val()

		url = "/users/subregion_options?parent_region=#{country_code}"
		select_wrapper.load(url)



$ ->
  $(".microposts").infinitescroll
    loading: {
      finishedMsg: ""
      img:     "/ajax_loader_blue_128.gif"
      msgText: "Now Loading..."
    }
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: ".microposts li" # selector for all items you'll retrieve

$ ->
  $(".users").infinitescroll
    loading: {
      finishedMsg: ""
      img:     "/ajax_loader_blue_128.gif"
      msgText: "Now Loading..."
    }
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: ".panel" # selector for all items you'll retrieve







initScroll = ->
  $(".users").infinitescroll('destroy');
  $(".users").data('infinitescroll', null);
  $(".microposts").infinitescroll('destroy');
  $(".microposts").data('infinitescroll', null);


$ ->
  $('#tweets')
    .on 'ajax:success', (event, data, status, xhr) ->
      initScroll()

      $(".microposts").infinitescroll
        loading: {
          finishedMsg: ""
          img:     "/ajax_loader_blue_128.gif"
          msgText: "Now Loading..."
        }
        navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
        nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
        itemSelector: ".microposts li" # selector for all items you'll retrieve
    .on 'ajax:error', (event, xhr, status, error) ->
      alert error

$ ->
  $('#favorites')
    .on 'ajax:success', (event, data, status, xhr) ->
      initScroll()

      $(".microposts").infinitescroll
        loading: {
          finishedMsg: ""
          img:     "/ajax_loader_blue_128.gif"
          msgText: "Now Loading..."
        }
        navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
        nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
        itemSelector: ".microposts li" # selector for all items you'll retrieve
    .on 'ajax:error', (event, xhr, status, error) ->
      alert error

$ ->
  $('#followings')
    .on 'ajax:success', (event, data, status, xhr) ->
      initScroll()

      $(".users").infinitescroll
        loading: {
          finishedMsg: ""
          img:     "/ajax_loader_blue_128.gif"
          msgText: "Now Loading..."
        }
        navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
        nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
        itemSelector: ".panel" # selector for all items you'll retrieve
    .on 'ajax:error', (event, xhr, status, error) ->
      alert error

$ ->
  $('#followers')
    .on 'ajax:success', (event, data, status, xhr) ->
      initScroll()

      $(".users").infinitescroll
        loading: {
          finishedMsg: ""
          img:     "/ajax_loader_blue_128.gif"
          msgText: "Now Loading..."
        }
        navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
        nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
        itemSelector: ".panel" # selector for all items you'll retrieve
    .on 'ajax:error', (event, xhr, status, error) ->
      alert error


