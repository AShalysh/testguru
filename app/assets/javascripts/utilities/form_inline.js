document.addEventListener('turbolinks:load', function() {
    var controls = document.querySelectorAll('.form-inline-link');
    if (controls.length) {
        for (var i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler);
        }
    }

    //if to use jQuery library then the above code would look like that:
    //$('.form-inline-link').on('click', formInlineLinkHandler)

    //if there is an error, we need to show the title form again
    var errors = document.querySelector('.resource-errors');

    var form_inline = document.querySelector('.form-inline')
    if (errors && form_inline) {
        var resourceId = errors.dataset.resourceId;
        formInlineHandler(resourceId);
    }
})
//working with link
function formInlineLinkHandler(event) {
    // in order not to use link
    event.preventDefault();
    //to show the edit form only for a chosen test
    var testId = this.dataset.testId;
    formInlineHandler(testId);
}

//working with the form we want to show
function formInlineHandler(testId) {
    //to find the link that we clicked
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]');
    //to find the Title of the test that we want to hide
    var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
    //to find the form_inline that we need to show
    var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');

    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide');
        formInline.classList.remove('hide');
        link.textContent = 'Cancel';
    } else {
        testTitle.classList.remove('hide');
        formInline.classList.add('hide');
        link.textContent = 'Edit';
    }

    //if to use jQuery library then the above code would look like that:
    // var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    // var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
    // var $formInline = $('.form-inline[data-test-id="' + testId + '"]')
    //
    // $formInline.toggle()
    // $testTitle.toggle()
    //
    // if($formInline.is(':visible')) {
    //     link.textContent = 'Cancel'
    // } else {
    //     link.textContent = 'Edit'
    // }
}