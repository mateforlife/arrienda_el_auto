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

  def car_icon(size = 24)
    "<img src='https://img.icons8.com/android/#{size}/000000/car.png'>".html_safe
  end

  def humanize_boolean(boolean)
    boolean ? 'Si' : 'No'
  end
end
