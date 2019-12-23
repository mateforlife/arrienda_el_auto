# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text =
        <<-HTML
          <script>toastr.#{type}('#{message}',
            '', { closeButton: true, progressBar: true })
          </script>
        HTML
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
end
