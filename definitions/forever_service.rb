define :forever_service do

  template "/etc/init.d/#{params[:name]}" do
    source "init.d.erb"
    owner params[:user]
    group params[:group]
    mode "0755"
    variables({
      :name => params[:name],
      :path => params[:path],
      :script => params[:script],
      :script_options => params[:script_options],
      :description => params[:description] || params[:name]
    })
  end

  service params[:name] do
    supports :status => true, :restart => true
    action params[:action]
  end

end