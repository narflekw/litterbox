namespace :doc do
  namespace :diagram do
    task :models do
      sh "railroad -i -l -a -m -M -j | sed 's/arrowtail=crow, arrowhead=dot/arrowhead=crow, arrowtail=dot/g' | dot -Tpng | sed 's/font-size:14.00/font-size:11.00/g' > doc/models_#{Time.now.to_s(:number)}.png"
    end

    task :controllers do
      sh "railroad -i -l -C -v | neato -Tpng | sed 's/font-size:14.00/font-size:11.00/g' > doc/controllers_#{Time.now.to_s(:number)}.png"
    end
  end

  task :diagrams => %w(diagram:models diagram:controllers)
end

