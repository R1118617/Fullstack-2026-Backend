query_insert_message = """
                           INSERT INTO fitness.contact_messages
                           (name, reason, email, message, terms_accepted)
                           VALUES (%s, %s, %s, %s, %s);
                       """

query_get_all_messages = """
                             SELECT id, name, reason, email,
                             message, terms_accepted, created_at
                             FROM fitness.contact_messages;
                         """

query_get_messages_by_reason = """
                                   SELECT id, name, reason, email,
                                   message, terms_accepted, created_at
                                   FROM fitness.contact_messages
                                   WHERE reason = %s;
                               """
