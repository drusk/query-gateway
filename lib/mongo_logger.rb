class MongoLogger
    LOG_COLLECTION = "job_log_events"    
    def initialize(options= {})
       @mongo_db = options[:mongo] || Mongoid.master
    end
    
   
    def add(job,message,extra={})
       @mongo_db[LOG_COLLECTION].insert(extra.merge({"job_id"=>job.id, "message"=>message, :time=>Time.new}))
    end
    
    
end
