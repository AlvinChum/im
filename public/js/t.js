

	//读取所有联系人
	function getAllMember(group_id) {
		var data = {
			group_id: group_id,
			n: new Date().getTime()
		};
		//$('.add-number-content').find('.add-member-button').on('click',function(){
		/*$('.all-member-float').show();
		$('.all-member-float').html('');
		$.post('/m/all-company', data, function(res) {
			$('div.all-member-float').append(res);
			addCustomGroup(group_id);
		});*/
		//退出自定义聊天组
		$('#modal_enter').on('click', function() {
			var $enter_btn = $(this);
			$enter_btn.attr('disabled', true);
			var data = {
				group_id: group_id
			};
			$('#modal_delete').find('.modal-body p').hide().next('.icon-wait').show();
			$.ajax({
					url: '/m/quit-custom-group',
					type: 'POST',
					dataType: 'json',
					data: data,
				})
				.done(function(res) {
					closeRightContact(true);
					$('ul.talk-group-menu').find('li[data-id=' + res + ']').remove();
					$('#modal_delete').modal('hide');
				})
				.fail(function() {
					console.log("error");
				})
				.always(function() {
					$('#modal_enter').off('click'); //总是解绑
					$enter_btn.attr('disabled', false);
					$('#modal_delete').find('.modal-body p').show().next('.icon-wait').hide();
				});

		});
	}