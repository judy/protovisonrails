require 'protovis'
module ProtovisTests
  def render_protovis_tests
    js =""
    js << dot_charts
    js << area_charts
    js << bar_charts
  end
  
  
  def dot_charts
      js = ""
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      dot= Protovis::Dot.new(:name=> 'dot',
                             :left => "function(d) d[0] *150",
                             :bottom => "function(d) d[1] *50",
                             :data => [[0.1, 1], [0.5, 1.2], [0.9, 1.7], [0.2, 1.5], [0.7, 2.2]]
                            )
      panel.add( dot )
      js << render_protovis_panel(panel)

      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      dot= Protovis::Dot.new(:name=> 'dot',
                             :left => "function() this.index * 25 + 10",
                             :bottom => "function(d) d * 80",
                             :data => [1, 1.2, 1.7, 1.5, 0.7]
                            )
      panel.add( dot )
      bar= Protovis::Bar.new(:name => 'bar',
                              :bottom => 0,
                              :width => 1, 
                              :left => "function() dot.left() - 0.5",
                              :height=> "function(d) dot.bottom() - 5")
      dot.add(bar)
      js << render_protovis_panel(panel)
      
      nestedSetData= [[0.1, 1, 0.4], [0.5, 1.2, 0.3], [0.9, 1.7, 0.1],
              [0.4, 1.5, 1], [0.3, 1.4, 4], [0.7, 2.2, 1]]
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      dot= Protovis::Dot.new(:name=> 'dot',
                             :left => "function(d) d[0] * 100",
                             :bottom => "function(d) d[1] * 50",
                             :size => "function(d) d[2] * 200",
                             :data => nestedSetData
                            )
      panel.add( dot )
      js << render_protovis_panel(panel)      
       
      nestedSetData.sort! {|x,y| x[2] <=> y[2] }
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      dot= Protovis::Dot.new(:name=> 'dot',
                             :left => "function(d) d[0] * 100",
                             :bottom => "function(d) d[1] * 50",
                             :size => "function(d) d[2] * 200",
                             :data => nestedSetData,
                             :strokeStyle => "white",
                             :fillStyle => Protovis::RGBA.new(30,120,180, 0.4)
                            )
      panel.add( dot )
      js << render_protovis_panel(panel)      
      
      
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      dot= Protovis::Dot.new(:name=> 'dot',
                            :left => "function(d) d[0] * 50",
                            :top => "function(d) d[1] * 50",
                            :data=> [[0.1, 1], [0.5, 1.2], [0.9, 1.7], [0.2, 1.5], [0.7, 2.2]])
      panel.add( dot )
      js << render_protovis_panel(panel)      

      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      dot= Protovis::Dot.new(:name=> 'dot',
                            :right => "function(d) d[0] * 50",
                            :top => "function(d) d[1] * 50",
                            :data=> [[0.1, 1], [0.5, 1.2], [0.9, 1.7], [0.2, 1.5], [0.7, 2.2]])
      panel.add( dot )
      js << render_protovis_panel(panel)      
      
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      dot= Protovis::Dot.new(:name=> 'dot',
                             :data => [Protovis::Shape::CIRCLE, Protovis::Shape::SQUARE, 
                                       Protovis::Shape::TRIANGLE, Protovis::Shape::CROSS, Protovis::Shape::DIAMOND],
                             :left => "function() Math.random() * 100 + 25",
                             :bottom => "function() this.index * 25 + 25",
                             :shape => "function(d) d",
                             :fillStyle => "function() pv.Colors.category10.values[this.index]")
        panel.add( dot )
        js << render_protovis_panel(panel)      
  end
  
  def area_charts
    js = ""
    panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
    area= Protovis::Area.new(:name=> 'area', 
                             :bottom=>0,
                             :height => "function(d) d* 80",
                             :left => "function() this.index *25",
                             :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
    panel.add( area )
    js << render_protovis_panel(panel) 
    
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>0,
                               :height => "function(d) d* 80",
                               :left => "function() this.index *25",
                               :fillStyle => Protovis::RGBA.new(30, 120, 160, 0.4),
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add( area )
      area2= Protovis::Area.new(:name=> 'area2', 
                               :fillStyle => Protovis::RGBA.new(30, 180, 120, 0.4),
                               :data => [0.4, 0.2, 0.8, 1.2, 1.5, 1.1, 0.8])
      area.add( area2 )
      js << render_protovis_panel(panel)
      
      
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>0,
                               :height => "function(d) d* 40",
                               :left => "function() this.index *25",
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add( area )
      area2= Protovis::Area.new(:name=> 'area2', 
                               :bottom => "function() area.bottom() + area.height()",
                               :data => [0.4, 0.2, 0.8, 1.2, 1.5, 1.1, 0.8])
      area.add( area2 )
      js << render_protovis_panel(panel)
      

      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>0,
                               :height => "function(d) d* 80",
                               :left => "function() this.index *25",
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add(area)
      line = Protovis::Line.new(:name=> 'line', 
                                :strokeStyle=> "black", 
                                :bottom=> 'function() area.bottom() + area.height()')
      area.add(line)
      line.add( Protovis::Dot.new(:name=>'dot'))

      js << render_protovis_panel(panel)
      
      
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>"function() this.index *25",
                               :width => "function(d) d* 80",
                               :left => 0,
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add(area)
      js << render_protovis_panel(panel)
  
  
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>"function() this.index *25",
                               :width => "function(d) d* 40",
                               :left => 0,
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add(area)
      area2= Protovis::Area.new(:name=> 'area2', 
                               :left => "function() area.left() + area.width()",
                               :data => [0.4, 0.2, 0.8, 1.2, 1.5, 1.1, 0.8])
      area.add(area2)
      line = Protovis::Line.new(:name=> 'line', 
                                :strokeStyle=> "white")
      area2.add(line)
      js << render_protovis_panel(panel)   
      
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>10,
                               :height => "function(d) d* 60",
                               :left => "function() this.index * 20 + 10",
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add(area)
      dot1= Protovis::Dot.new(:name=> 'dot1', :fillStyle=>"green")
      dot2= Protovis::Dot.new(:name=> 'dot2', :fillStyle=>"red")
      area.add(dot1, Protovis::Anchor::TOP)
      area.add(dot2, Protovis::Anchor::BOTTOM)
      js << render_protovis_panel(panel)


      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>75,
                               :height => "function(d) d* 30",
                               :left => "function() this.index * 22 + 10",
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add(area)
      area2= Protovis::Area.new(:name=> 'area2', 
                                :data => [0.4, 0.2, 0.8, 1.2, 1.5, 1.1, 0.8])
      area.add(area2, Protovis::Anchor::BOTTOM)
      js << render_protovis_panel(panel)
      
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>"function(d) d * 10 + 55",
                               :height => "function(d) d* 30",
                               :left => "function() this.index * 22 + 10",
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add(area)
      area2= Protovis::Area.new(:name=> 'area2', 
                                :data => [0.4, 0.2, 0.8, 1.2, 1.5, 1.1, 0.8])
      area.add(area2, Protovis::Anchor::BOTTOM)
      js << render_protovis_panel(panel)
      
      
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      area= Protovis::Area.new(:name=> 'area', 
                               :bottom=>"function(d) this.index * 20 + 10 ",
                               :width => "function(d) d* 60",
                               :left => 10,
                               :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2])
      panel.add(area)
      line = Protovis::Line.new(:name=>'line', :strokeStyle=>"green")
      line2= Protovis::Line.new(:name=> 'line2', :strokeStyle => "red")
      area.add(line, Protovis::Anchor::RIGHT)
      area.add(line2, Protovis::Anchor::LEFT)
      js << render_protovis_panel(panel)
      
        panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
        area= Protovis::Area.new(:name=> 'area', 
                                 :left=>"function(d) this.index * 20 + 10 ",
                                 :height => "function(d) d* 75",
                                 :bottom => 10,
                                 :data => [1, 1.2, 1.7, 1.5, 0.7, 0.5, 0.2],
                                 :strokeStyle=>"black")
        panel.add(area)
        js << render_protovis_panel(panel)


      
  end

  def bar_charts
    js = ""
      panel =  Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
    	bar= Protovis::Bar.new(:name=> 'bar', 
                   :width=> 20,
                   :bottom=> 0, 
                   :height=> "function(d) d * 80",
                   :left => "function() this.index * 25",
                   :data => [1, 1.2, 1.7, 1.5, 0.7]
                   )
      panel.add( bar )
      js << render_protovis_panel(panel)

      panel=Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
    	bar= Protovis::Bar.new(:name=> 'bar', 
                   :width=> 10,
                   :bottom=> 0, 
                   :height=> "function(d) d * 80",
                   :left => "function() this.index * 25",
                   :data => [1, 1.2, 1.7, 1.5, 0.7]
                   )
      panel.add(bar)
      bar2= Protovis::Bar.new(:name=> 'bar2', 
                   :data => [0.5, 1, 0.8, 1.1, 1.3],
                   :left => "function() bar.left() + bar.width()"
                   )
      bar.add( bar2)
  
      js << render_protovis_panel(panel)
    
      panel=Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
    	bar= Protovis::Bar.new(:name=> 'bar', 
                   :width=> 20,
                   :bottom=> 0, 
                   :height=> "function(d) d * 50",
                   :left => "function() this.index * 25",
                   :data => [1, 1.2, 1.7, 1.5, 0.7])
                 
     panel.add( bar )
     bar2= Protovis::Bar.new(:name=> 'bar2', 
                  :data => [0.5, 1, 0.8, 1.1, 1.3],
                  :bottom => "function() bar.height() + bar.bottom()"
                  )
     bar.add( bar2)
     js << render_protovis_panel(panel)
   
      panel=Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
    	bar= Protovis::Bar.new(:name=> 'bar', 
                   :bottom=> "function() this.index * 25",
                   :width=> "function(d) (d[1] -d[0])* 50", 
                   :height=> 20,
                   :left => "function(d) d[0] * 50",
                   :data => [[0, 1], [0.5, 1.2], [0.9, 1.7], [0.2, 1.5], [0.7, 2.2]])
     panel.add( bar )
     js << render_protovis_panel(panel)
   
   
      panel=Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
    	bar= Protovis::Bar.new(:name=> 'bar', 
                   :top => 0,
                   :width => 20,
                   :height =>  "function(d) d* 80",
                   :left => "function() this.index * 25",
                   :data => [1, 1.2, 1.7, 1.5, 0.7])
     panel.add( bar )
     js << render_protovis_panel(panel)
   
   
        panel=Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
      	bar= Protovis::Bar.new(:name=> 'bar', 
                     :bottom => 0,
                     :width => 20,
                     :height =>  "function(d) d* 80",
                     :right=> "function() this.index * 25",
                     :data => [1, 1.2, 1.7, 1.5, 0.7])
       panel.add( bar )
       js << render_protovis_panel(panel)   

          panel=Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
        	bar= Protovis::Bar.new(:name=> 'bar', 
                       :left => 0,
                       :right => 0,
                       :height =>  25,
                       :fillStyle => "function(d) d",
                       :top=> "function() this.index * 25",
                       :data => ["red", "orange", "yellow", "green", "blue", "purple"])
         panel.add( bar )
         js << render_protovis_panel(panel)


          panel=Protovis::Panel.new(:name=> 'panel', :width=> 150, :height => 150 )
        	bar= Protovis::Bar.new(:name=> 'bar', 
                       :bottom => 2,
                       :width=> 20,
                       :height =>  "function(d) d * 80",
                       :left => "function() this.index * 25 + 2",
                       :strokeStyle => "function(d) (d > 1 ) ? 'red' : 'black'",
                       :data=> [1, 1.2, 1.7, 1.5, 0.7]
                       )
                     
         panel.add( bar )
         js << render_protovis_panel(panel)
  end
end