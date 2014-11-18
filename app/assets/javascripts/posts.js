init.push(function () {
        if (! $('html').hasClass('ie8')) {
          $("#post-body").markdown({ iconlibrary: 'fa' });
        }

        $('#markdown-boxed').switcher({
          on_state_content: '<span class="fa fa-check" style="font-size:11px;"></span>',
          off_state_content: '<span class="fa fa-times" style="font-size:11px;"></span>'
        });
        $('#markdown-boxed').on($('html').hasClass('ie8') ? "propertychange" : "change", function () {
          var $panel = $(this).parents('.panel');
          if ($(this).is(':checked')) {
            $panel.find('.panel-body').addClass('no-padding');
            $panel.find('.panel-body > *').addClass('no-border');
          } else {
            $panel.find('.panel-body').removeClass('no-padding');
            $panel.find('.panel-body > *').removeClass('no-border');
          }
        });
      });