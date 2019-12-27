# frozen_string_literal: true

# FilesHelper
module FilesHelper
  def preview(file, width = 740, height = 460)
    if file.previewable?
      file.preview(resize_to_limit: [width, height])
    else
      file.variant(resize_to_limit: [width, height])
    end
  end
end
