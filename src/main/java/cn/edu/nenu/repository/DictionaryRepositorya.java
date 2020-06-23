package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Dictionarya;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DictionaryRepositorya extends PlatformRepository<Dictionarya,Long> {


    @Query("from Dictionarya d where d.type=?1 order by d.sort asc ")
    List<Dictionarya> findByTypeOrderBySort(String type);

    Dictionarya findFirstByOrderBySortDesc();
}
