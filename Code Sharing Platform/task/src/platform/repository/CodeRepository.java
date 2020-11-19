package platform.repository;

import org.springframework.data.repository.CrudRepository;
import platform.entity.Code;

public interface CodeRepository extends CrudRepository<Code, String> {
}
