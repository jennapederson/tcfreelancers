$(document).on('page:change', function() {
    var select = $('#user_specialty_tag_list');
    var placeholder = $(select).data('placeholder');
    var url = $(select).data('url');
    var saved = $(select).data('saved');

    $(select).select2({
        tags: true,
        placeholder: placeholder,
        minimumInputLength: 1,
        maximumSelectionSize: 5,
        tokenSeparators: [','],
        initSelection: function(element, callback) {
            saved && callback(saved);
        },
        ajax: {
            url: url,
            dataType: 'json',
            data: function(term) {
                return {
                    q: term
                };
            },
            results: function(data) {
                return {
                    results: data
                };
            }
        },
        createSearchChoice: function(term, data) {
            if ($(data).filter(function() {
                return this.name.localeCompare(term) === 0;
            }).length === 0) {
                return {
                    id: term,
                    name: term
                };
            }
        },
        formatResult: function(item, page) {
            return item.name;
        },
        formatSelection: function(item, page) {
            return item.name;
        }
    });

     
    $("#user_specialty_tag_list").select2("container").find("ul.select2-choices").sortable({
        containment: 'parent',
        start: function() {
            $("#user_specialty_tag_list").select2("onSortStart");
        },
        update: function() {
            $("#user_specialty_tag_list").select2("onSortEnd");
        }
    });
});