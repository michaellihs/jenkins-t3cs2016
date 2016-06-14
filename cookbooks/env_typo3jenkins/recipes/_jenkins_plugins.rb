{
  'pipeline-build-step' => {:version => nil},
  'pipeline-input-step' => {:version => nil},
  'pipeline-rest-api' => {:version => nil},
  'pipeline-stage-step' => {:version => nil},
  'pipeline-stage-view' => {:version => nil},
  'git' => {:version => nil},
  'git-client' => {:version => nil},
  'git-server' => {:version => nil},
  'scm-api' => {:version => nil}
}.each do |plugin_name, plugin_configuration|

  jenkins_plugin plugin_name do
    if plugin_configuration[:version]
      version plugin_configuration[:version]
    end
  end

end


# TODO we need to restart Jenkins at the end...

=begin

All plugins currently installed on Jenkins:

ace-editor
ansicolor
ant
antisamy-markup-formatter
branch-api
build-blocker-plugin
build-pipeline-plugin
cloudbees-folder
cloverphp
credentials
custom-job-icon
cvs
durable-task
external-monitor-job
git
git-client
git-server
greenballs
handlebars
instant-messaging
jabber
javadoc
jenkinswalldisplay
job-dsl
jquery
jquery-detached
junit
ldap
mailer
mapdb-api
mask-passwords
matrix-auth
matrix-project
maven-plugin
momentjs
nested-view
nodelabelparameter
pam-auth
parameterized-trigger
performance
pipeline-build-step
pipeline-input-step
pipeline-rest-api
pipeline-stage-step
pipeline-stage-view
scm-api
script-security
ssh-agent
ssh-credentials
ssh-slaves
structs
subversion
template-project
token-macro
translation
windows-slaves
workflow-aggregator
workflow-api
workflow-basic-steps
workflow-cps
workflow-cps-global-lib
workflow-durable-task-step
workflow-job
workflow-multibranch
workflow-remote-loader
workflow-scm-step
workflow-step-api
workflow-support

=end