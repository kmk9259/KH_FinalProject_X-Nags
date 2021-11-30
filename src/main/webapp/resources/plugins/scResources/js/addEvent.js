var eventModal = $('#eventModal');

var modalTitle = $('.modal-title');
var editAllDay = $('#edit-allDay');
var editTitle = $('#edit-title');
var editStart = $('#edit-start');
var editEnd = $('#edit-end');
var editType = $('#edit-type');
var editColor = $('#edit-color');
var editDesc = $('#edit-desc');

var addBtnContainer = $('.modalBtnContainer-addEvent');
var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');


/*일정추가*/
var newEvent = function (start, end, eventType) {

    $("#contextMenu").hide(); //메뉴 숨김

    modalTitle.html('새로운 일정');
    editType.val(eventType).prop('selected', true);
    editTitle.val('');
    editStart.val(start);
    editEnd.val(end);
    editDesc.val('');
    
    addBtnContainer.show();
    modifyBtnContainer.hide();
    eventModal.modal('show');


    //새로운 일정 저장버튼 클릭
    $('#save-event').unbind();
    $('#save-event').on('click', function () {
        var eventData = {
        		empId: empId,
        		scheduleTitle: editTitle.val(),
        		scheduleStart: editStart.val(),
        		scheduleEnd: editEnd.val(),
        		scheduleDescription: editDesc.val(),
        		scheduleType: $('#edit-type > option').val(),
        		scheduleBackground: editColor.val(),
        		scheduleTextcolor: '#ffffff',
        		scheduleAllDay: 0,
        		userName: username
        };
        console.log(eventData);
        console.log(eventData.scheduleTitle);

        if (eventData.scheduleTitle === '') {
            alert('일정명은 필수입니다.');
            return false;
        }

        if (eventData.scheduleStart > eventData.scheduleEnd) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        var realEndDay;

        if (editAllDay.is(':checked')) {
            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
            //렌더시 날짜표기수정
            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
            //DB에 넣을때
            realEndDay = moment(eventData.end).format('YYYY-MM-DD');
            eventData.scheduleAllDay = 1;
        }

        $("#calendar").fullCalendar('renderEvent', eventData, true);
     
        eventModal.find('input, textarea').val('');
        editAllDay.prop('checked', false);
        eventModal.modal('hide');

        //새로운 일정 저장
        $.ajax({
            type: "post",
            url: "insertSchedule",
            data: JSON.stringify(eventData), 
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            success: function (response) {
            	console.log(response)
                $('#calendar').fullCalendar('removeEvents');
                $('#calendar').fullCalendar('refetchEvents');
            },error:function(e){
                console.log(" ajax 통신 실패_일정저장");
                console.log(e);
            }
        });/*ajax 새로운 일정 저장*/
    }); /*새로운일정저장버튼 클릭할때*/
};/*일정추가*/