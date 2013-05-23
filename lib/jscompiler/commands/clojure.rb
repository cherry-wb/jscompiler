#--
# Copyright (c) 2013 Michael Berkovich
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

module Jscompiler
  module Commands
  
    class Clojure < Base

      def run
        generate_debug_version(group)

        args = [
          ["--js", Jscompiler::Config.files(group).join(' ')],
          ["--js_output_file", Jscompiler::Config.output_destination(group)],
          ["--warning_level", Jscompiler::Config.compiler["warning_level"] || "DEFAULT"] 
        ]

        compiler_path = File.expand_path(File.join(File.dirname(__FILE__), "../../../vendor/clojure/compiler.jar"))
        execute(prepare_command("java -jar #{compiler_path}", args))
      end

    end

  end
end
