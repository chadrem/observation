module Observation::Dispatcher
  def add_listener(event_type, callback = nil, &block)
    setup_event_dispatcher
    validate_event_type(event_type)

    if (callback && block) || (callback.nil? && block.nil?)
      raise('You must provide a callback or block, but not both')
    end

    cb = (callback || block)
    callbacks = (@dispatcher_callbacks[event_type] ||= [])

    if callbacks.include?(cb)
      return false
    end

    callbacks << cb

    return true
  end

  def remove_listener(event_type, callback)
    setup_event_dispatcher
    validate_event_type(event_type)

    if (callbacks = @dispatcher_callbacks[event_type])
      if callbacks.delete(callback)
        if callbacks.empty?
          @dispatcher_callbacks.delete(event_type)
        end

        return true
      end
    end

    return false
  end

  def remove_all_listeners(event_type)
    setup_event_dispatcher
    validate_event_type(event_type)

    @dispatcher_callbacks.delete(event_type)

    return true
  end

  def listening_event_types
    setup_event_dispatcher

    return @dispatcher_callbacks.keys
  end

  private

  def dispatch(event_type, data = {})
    setup_event_dispatcher
    validate_event_type(event_type)

    unless (callbacks = @dispatcher_callbacks[event_type])
      return false
    end

    callbacks.each do |callback|
      callback.call(event_type, data)
    end

    return true
  end

  def setup_event_dispatcher
    @dispatcher_callbacks ||= {}
  end

  def validate_event_type(event_type)
    raise('Event type must be a String.') unless event_type.is_a?(String)
  end
end
