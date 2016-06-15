xml = File.join(Chef::Config[:file_cache_path], 'pipeline-job.xml')

template xml do
  source 'pipeline-job.xml.erb'
end

jenkins_job 'typo3-pipeline-job' do
  config xml
end
