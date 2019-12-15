#if (${PACKAGE_NAME} && ${PACKAGE_NAME} != "")package ${PACKAGE_NAME};#end

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sql2o.Connection;

import java.util.Date;
import java.util.List;

#parse("File Header.java") 
public final class ${NAME}Dao {
	public static final Logger log = LoggerFactory.getLogger(${NAME}Dao.class);
	private Connection connection;

	public ${NAME}Dao(final Connection connection) {
		this.connection = connection;
	}

	String GET_${NAME}S = "SELECT id, user_id, reference_id, created_at, updated_at FROM user_${NAME}s WHERE user_id = :userId ORDER BY created_at OFFSET :offset LIMIT :limit";
	String CREATE = "insert into ${NAME.toLowerCase()}s(user_id, reference_id, created_at, updated_at) " +
			"values (:userId, :referenceId, :createdAt, :updatedAt)";

	String DELETE = "delete from ${NAME.toLowerCase()}s where reference_id = :referenceId AND user_id = :userId";

	public List<${NAME}Rec> all(long userId, long offset, long limit) {
		log.info("all userId: {} offset : {} limit : {}", userId, offset, limit);
		return connection.createQuery(GET_${NAME}S)
				.addParameter("offset", offset).addParameter("limit", limit)
				.addParameter("userId", userId)
				.executeAndFetch(${NAME}Rec.class);
	}

	public void create(long userId, int referenceId) {
		log.info("create userId: {} referenceId: {}", userId, referenceId);
		connection.createQuery(CREATE)
				.addParameter("userId", userId)
				.addParameter("referenceId", referenceId)
				.addParameter("createdAt", new Date())
				.addParameter("updatedAt", new Date())
				.executeUpdate();
	}

	public void delete(long userId, int referenceId) {
		log.info("delete userId: {} referenceId: {}", userId, referenceId);
		connection.createQuery(DELETE)
				.addParameter("userId", userId)
				.addParameter("referenceId", referenceId)
				.executeUpdate();
	}
}