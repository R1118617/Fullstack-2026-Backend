# Name: Rene
# Class: Van Asch
# R-number: r1089588
# branch dat ik werk: rene-contactpagina

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

query_insert_faq = """
                      INSERT INTO fitness.faq
                      (question, answer)
                      VALUES (%s, %s);
                   """

query_get_faq_data =  """
                        SELECT id, question, answer
                        FROM fitness.faq;
                      """