class S3Store

  def initialize file
    @file = file
    @bucket = S3_BUCKET
  end

  def store
    @obj = @bucket.object(prefix_filename)
    @uploaded_file = @obj.upload_file(@file.tempfile)
    self
  end

  def url
    @obj.public_url.to_s
  end

  def key
    @obj.key.to_s
  end

  def filename
    @filename ||= "#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}-#{@file.original_filename.gsub(/[^a-zA-Z0-9_\.]/, '_')}"
  end

  private
  
  def prefix_filename
    @prefix_filename ||= "tmp/#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}-#{@file.original_filename.gsub(/[^a-zA-Z0-9_\.]/, '_')}"
  end

end