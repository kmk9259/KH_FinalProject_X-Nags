/*일정수정,삭제*/
var editEvent = function (event, element, view) {

	console.log('scheduleNo : ' + event.scheduleNo);
    $('#deleteEvent').data('id', event._id); //클릭한 이벤트 ID

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //수정 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;
        var scheduleAllDay = 0;
        if (editAllDay.is(':checked')) {
            statusAllDay = true;
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
            scheduleAllDay = 1;
        } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
            scheduleAllDay = 0;
        }

        eventModal.modal('hide');
        	
        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();

       

        //일정 수정
        $.ajax({
            type: "post",
            url: "updateSchedule",
            data: JSON.stringify({
            	scheduleNo:event.scheduleNo,
            	empId: empId,
        		scheduleTitle: editTitle.val(),
        		scheduleStart: editStart.val(),
        		scheduleEnd: editEnd.val(),
        		scheduleDescription: editDesc.val(),
        		scheduleType: $('#edit-type > option').val(),
        		scheduleBackground: editColor.val(),
        		scheduleTextcolor: '#ffffff',
        		scheduleAllDay: scheduleAllDay,
        		userName: username
            }),
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            success: function (response) {
                alert('수정되었습니다.')
                //$("#calendar").fullCalendar('updateEvent', event);
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });

    });
    
 // 삭제버튼
    $('#deleteEvent').on('click', function () {
        
        $('#deleteEvent').unbind();
        $("#calendar").fullCalendar('removeEvents', $(this).data('id'));
        eventModal.modal('hide');

       
        //삭제시
        $.ajax({
            type: "post",
            url: "deleteSchedule",
            data: JSON.stringify({
            	scheduleNo:event.scheduleNo,
            }),
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            success: function (response) {
                alert('삭제되었습니다.');
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            }
        });

    });
};




