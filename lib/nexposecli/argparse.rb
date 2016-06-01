module Nexposecli

class ArgParse

    #
    # Error types. Shamelessly stolen from GetoptLong.
    #

    class Error  < StandardError; end
    class MissingArgument  < Error; end
    class ExtraneousArgument  < Error; end
    class InvalidArgument  < Error; end

    attr_accessor :opt_table

    def initialize(yaml_str)
        @opt_def        = YAML.parse(yaml_str).transform
        @opt_table      = Hash.new

    end

    def parse

        short_to_name   = {}

        @opt_def.each { |hash|
            next if hash['comment']
            if hash['short']
                sa                  = '-' + hash['short']
                short_to_name[sa]   = hash['name']
            end
            opt_table[hash['name']] = hash['default'] if hash['default']
        }

        acount  = 0

        arg_len  = ARGV.length
        opt_name = nil
        opt_hash = nil

        while (acount <= ARGV.length)
            #puts "ARGV: " + ARGV.inspect
            #puts "acount: #{acount}"
            #puts "SW: #{ARGV[acount]}"
            str = ARGV[acount]
            #puts "1STR: #{str}"

            opt_arg = true
            case str
                when    /^--([^=]+)$/
                    opt_name    = $1.gsub(/-/, '_')
                    opt_hash    = @opt_def.select { |h| h['name'] == opt_name }.shift
                    raise InvalidArgument, "No such opt: #{str}" unless opt_hash

                    #p opt_hash
                    ARGV.delete_at(acount)

                    if opt_hash['required']
                        opt_arg     = ARGV.delete_at(acount)
                        #puts "ARG: '#{opt_arg}'"
                    end

                 when    /^--([^=]+)=(.*)/
                    opt_name, opt_arg  = $1, $2
                    opt_name.gsub!(/-/, '_')

                    opt_hash    = @opt_def.select { |h| h['name'] == opt_name }.shift
                    raise InvalidArgument, "No such opt: #{str}" unless opt_hash
                    raise ExtraneousArgument, "Option '--#{opt_name}' does not take an argument" unless opt_hash['required']

                    ARGV.delete_at(acount)

               when    /^-(.*)/
                    #puts "*three"
                    sopts = $1.split(//)
                    slen  = sopts.length

                    ARGV.delete_at(acount)
                    sopts.each_with_index { |short_opt, i|
                        sopt        = '-' + short_opt
                        opt_name    = short_to_name[sopt]

                        raise InvalidArgument, "No such opt: #{sopt}" unless opt_name

                        opt_hash    = @opt_def.select { |h| h['name'] == opt_name }.shift

                        #p @opt_def
                        #p sopt, opt_name, opt_hash

                        raise InvalidArgument, "No such opt: #{sopt}" unless opt_hash
                       # p opt_hash

                        raise MissingArgument, "#{sopt} requires argument" if opt_hash['required'] && i != slen - 1

                        if i == slen - 1 && opt_hash['required'] 
                            opt_arg = ARGV.delete_at(acount)
                            raise MissingArgument, "#{sopt} requires argument" unless opt_arg
                        end

                        @opt_table[opt_name] = opt_arg
                        #puts "NA: #{opt_name} #{opt_arg}"
                    }
                    next

                else
                    #puts "STR: #{str}"
                    #puts "ELSE: #{ARGV}"
                    #puts
                    acount += 1
                    next

            end

            if opt_arg == '-'               # read from stdin
                opt_arg = STDIN.readlines.map(&:strip).map { |s| s != '' ? s : nil }.compact
                opt_hash['proc'] = nil
            end

            @opt_table[opt_name] = opt_arg

            #puts "acount end : #{acount}"
            #puts
        end

        #p @opt_table

        @opt_table.keys.each { |opt_name|
            
            opt_hash    = @opt_def.select { |h| h['name'] == opt_name }.shift

            if prc = opt_hash['proc']
                @opt_table[opt_name] = @opt_table[opt_name].instance_eval(prc)
            end
        }

        #p @opt_table
        return OpenStruct.new(@opt_table)

    end

    def usage(usage_str = nil)

        if usage_str
            str = "Usage: #{usage_str}\n"
        else
            str = ""
        end

        @opt_def.each { |opt_hash|
            if opt_hash['comment']
                str << "\n" + opt_hash['comment'] + "\n\n"
            else
                long_opt    = '--' + opt_hash["name"].gsub(/_/, '-')
                short_opt   = opt_hash['short'] ? '-'  + opt_hash['short'] : "  "
                desc        = opt_hash['desc']
                req_str     = opt_hash['required'] ? " ARG" : " "
                def_str     = opt_hash['default'] ? " (def: #{opt_hash['default']})" : " "

                str << sprintf("    %-40s (%s) : %s\n", "#{long_opt}#{req_str}", short_opt, desc + def_str)
            end
        }
        return str
    end

end

end
