class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  process resize_to_fit: [640, nil]
  def store_dir
    "uploads/photos/"
  end
  # 文件名以时间序列命名
  def filename
    if super.present?
      @name ||= Digest::MD5.hexdigest(current_path)
      "#{Time.now.year}/#{@name}.#{file.extension.downcase}"
    end
  end
  # 图片类型白名单
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
