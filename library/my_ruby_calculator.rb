#!/usr/bin/ruby
# WANT_JSON

require 'rubygems'
require 'json'

# this is a bare minimum example of a 'facts' module that returns some variables into the ansible
# namespace.  It may not be sufficiently idiomatic and doesn't do a lot of error checking.

File.open(ARGV[0]) do |fh|

   data = JSON.parse(fh.read())

   begin
      a = data['a'].to_i()
      b = data['b'].to_i()
   rescue
      # to raise an error, return failed=True and a msg string.

      print JSON.dump({
          'failed' => true,
          'msg'    => 'failed to parse inputs x or y'
      })

      # the error code here is not so important, the JSON is!

      exit(1)
   end

   # we may also wish to return changed=True or changed=False
   # if we were modifying system resources to support handlers and change tracking
   # if the module decides to not run, it can also return skipped=True

   result = {
      'a'   => a,
      'b'   => b,
      'sum' => a + b,
   }

   print JSON.dump(result)

end
