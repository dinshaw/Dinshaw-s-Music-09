module GigHelper
  def time_start_html_for_index(gig)
    show_time(gig, :start => true, :end => false)
  end
  
  def time_end_html_for_index(gig)
    show_time(gig, :start => false, :end => true)
  end
  
  def show_time(gig, options={})
    opts = {:start => true, :end => true}
    opts.merge!(options)
    s = []
    s << gig.time_start.to_s(:gig) if opts[:start]
    s << 'to' if opts[:start] && opts[:end]
    s << gig.time_end.to_s(:time_end) if opts[:end]
    s.join(" ")
  end
end
