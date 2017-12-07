require ('pg')

class SqlRunner

  def SqlRunner.run(sql, values = [])
    db = PG.connect({dbname: 'record_collection', host: 'localhost'})
    db.prepare('query', sql)
    result = db.exec_prepared('query', values)
    db.close()
    return result
  end

end

#SqlRunner with error handling
# require('pg')
#
# class SqlRunner
#
#   def self.run(sql, values)
#     begin
#       db = PG.connect({dbname: "music_library", host: "localhost"})
#       db.prepare("query", sql)
#       result = db.exec_prepared("query", values)
#     rescue PG::ConnectioBad
#       p "Bad connection, check connection strings"
#     ensure
#       p "Closing database"
#       db.close() if db != nil
#     end
#     return result
#   end
#
# end
