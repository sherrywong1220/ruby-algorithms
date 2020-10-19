# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
    (0...emails.length).each do |i|
        email = emails[i]
        local, domain = email.split('@')
        local.delete!('.')
        local.sub!(/\+.*/,'')
        emails[i] = "#{local}@#{domain}"
    end

    emails.uniq.count
end
